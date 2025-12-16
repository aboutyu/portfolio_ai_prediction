import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { LeaveDto } from 'src/dto/membership.leave.dto';
import { LoginDto } from 'src/dto/membership.login.dto';
import { LogoutDto } from 'src/dto/membership.logout.dto';
import { SignupDto } from 'src/dto/membership.signup.dto';
import { User } from 'src/entities/user.entity';
import { UserDevice } from 'src/entities/user-devices.entity';
import { ApiResponse } from 'src/helpers/dto/api.response.dto';
import { FailureCode, failureResponse, successResponse } from 'src/helpers/enums/status.enum';
import { DataSource, Repository } from 'typeorm';
import { CertTokenService, RefreshTokenStatus, RefreshTokenStatusPayload } from 'src/auth/cert-token.service';
import { RoleType } from 'src/helpers/enums/role-type.enum';
import { RequestTokenDto } from 'src/dto/membership.requestToken.dto';

@Injectable()
export class MembershipService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,

    @InjectRepository(UserDevice)
    private readonly userDeviceRepository: Repository<UserDevice>,

    private readonly certTokenService: CertTokenService,
    private readonly dataSource: DataSource,
  ) { }
  
  private readonly selection = {
    sequence: true,
    userId: true,
    username: true,
    lastLogin: true,
  } as const;

  async login(data: LoginDto): Promise<ApiResponse<User | null>> {
    const { userId, password, deviceToken, deviceType, deviceName, deviceModel } = data;
    const user = await this.userRepository
      .findOne(
        {
          where: { userId, password, isActivate: true },
          relations: { devices: true },
          select: {
            ...this.selection,
            devices: {
              deviceToken: true,
              deviceType: true,
              deviceName: true,
              deviceModel: true,
            },
          },
        }
      );
    
    // 로그인 실패 처리
    if (!user) {
      return failureResponse(FailureCode.LOGIN_FAILED);
    }

    // Transactional 처리(에러 발생 시 롤백)
    if (deviceToken && deviceType && (deviceType === 'IOS' || deviceType === 'AOS')) {
      user.devices = await this.dataSource.transaction(async (manager) => {
        await manager.delete(UserDevice, { userSequence: user.sequence });
        const savedDevice = await manager.save(UserDevice, {
          userSequence: user.sequence,
          deviceToken,
          deviceType,
          deviceName,
          deviceModel,
        });
        const { userSequence, ...device } = savedDevice;
        return [device] as any;
      });
    }

    const refreshToken = await this.certTokenService.makeRefreshToken();
    const accessToken = await this.certTokenService.makeAccessToken(
      user.sequence,
      user.userId,
      user.username,
      RoleType.USER_ROLE 
    );

    user.lastLogin = new Date();
    user.refreshToken = refreshToken.refreshToken;
    user.accessToken = accessToken;
    await this.userRepository.update(
      { sequence: user.sequence },
      { refreshToken: refreshToken.refreshToken, lastLogin: user.lastLogin }
    );
    return successResponse(user);
  }

  async requestToken(data: RequestTokenDto): Promise<ApiResponse<User | null>> {
    const { sequence, userId, refreshToken, deviceToken, deviceType, deviceName, deviceModel } = data;
    if (!refreshToken || refreshToken.length === 0) {
      return failureResponse(FailureCode.LOGIN_FAILED);
    }

    // 리프레스토큰 복호화 및 유효성 검증
    const payload = await this.certTokenService.decodeToken(refreshToken) as RefreshTokenStatusPayload;
    if (!payload || payload.status !== RefreshTokenStatus.VALID) {
      return failureResponse(FailureCode.LOGIN_FAILED);
    }

    const user = await this.userRepository
      .findOne(
        {
          where: { sequence, userId, refreshToken, isActivate: true },
          relations: { devices: true },
          select: {
            ...this.selection,
            devices: {
              deviceToken: true,
              deviceType: true,
              deviceName: true,
              deviceModel: true,
            },
          },
        }
      );
    
    // 로그인 실패 처리
    if (!user) {
      return failureResponse(FailureCode.LOGIN_FAILED);
    }

    // Transactional 처리(에러 발생 시 롤백)
    if (deviceToken && deviceType && (deviceType === 'IOS' || deviceType === 'AOS')) {
      user.devices = await this.dataSource.transaction(async (manager) => {
        await manager.delete(UserDevice, { userSequence: user.sequence });
        const savedDevice = await manager.save(UserDevice, {
          userSequence: user.sequence,
          deviceToken,
          deviceType,
          deviceName,
          deviceModel,
        });
        const { userSequence, ...device } = savedDevice;
        return [device] as any;
      });
    }

    const newRefreshToken = await this.certTokenService.makeRefreshToken();
    const accessToken = await this.certTokenService.makeAccessToken(
      user.sequence,
      user.userId,
      user.username,
      RoleType.USER_ROLE 
    );

    user.lastLogin = new Date();
    user.refreshToken = newRefreshToken.refreshToken;
    user.accessToken = accessToken;
    await this.userRepository.update(
      { sequence: user.sequence },
      { refreshToken: newRefreshToken.refreshToken, lastLogin: user.lastLogin }
    );
    return successResponse(user);
  }

  async logout(data: LogoutDto): Promise<ApiResponse<null>> {
    const { sequence, deviceToken, deviceType } = data;
    this.dataSource.transaction(async (manager) => {
      await manager.delete( UserDevice, {
        userSequence: sequence,
        deviceToken,
        deviceType,
      });
    });
    return successResponse(null);
  }

  async signup(data: SignupDto): Promise<ApiResponse<User | null>> {
    const { userId, password, username } = data;
    const existingUser = await this.userRepository
      .findOne({ where: { userId } });
    
    if (existingUser) {
      return failureResponse(FailureCode.SIGNUP_EXISTING_USER);
    }

    const newUser = this.userRepository.create({ userId, password, username, isActivate: true });
    await this.userRepository.save(newUser);
    
    const user = await this.userRepository.findOne({
      where: { userId, password, username, isActivate: true },
      select: this.selection,
    });
    return successResponse(user);
  }

  async leave(data: LeaveDto): Promise<ApiResponse<User | null>> {
    const { sequence, userId, password } = data;
    const user = await this.userRepository
      .findOne(
        {
          where: { sequence, userId, password, isActivate: true },
          select: this.selection,
        }
      );
    
    if (user) {
      await this.dataSource.transaction(async (manager) => {
        user.isActivate = false;
        await manager.save(User, user);
        await manager.delete(UserDevice, { userSequence: user.sequence });
      });
      return successResponse(user);
    } else {
      return failureResponse(FailureCode.NOT_FOUND_USER);
    }
  }
}
