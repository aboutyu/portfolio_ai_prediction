import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PageDto } from 'src/dto/page.dto';
import { UserDevice } from 'src/entities/user-devices.entity';
import { User } from 'src/entities/user.entity';
import { pageSize } from 'src/helpers/constants';
import { DeviceType } from 'src/types/device.type';
import { DataSource, Repository } from 'typeorm';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,

    @InjectRepository(UserDevice)
    private readonly userDeviceRepository: Repository<UserDevice>,
  ) {}

  private readonly detailSelection = {
    sequence: true,
    userId: true,
    username: true,
    createDate: true,
    lastLogin: true,
    agreeRequiredTerms: true,
    refreshToken: true,
    thumbnail: true,
    devices: true,
    memo: true,
  } as const;

  async getUsers(dto: PageDto) {
    const [items, total] = await this.userRepository
      .createQueryBuilder('user')
      // 관계 데이터의 개수를 가상 컬럼에 매핑
      .loadRelationCountAndMap('user.deviceCount', 'user.devices')
      .loadRelationCountAndMap('user.foodLogCount', 'user.foodLogs')
      .loadRelationCountAndMap('user.healthLogCount', 'user.healthLogs')
      .orderBy('user.createDate', 'DESC')
      .skip(dto.skip)
      .take(pageSize)
      .getManyAndCount();

    return {
      items,
      total,
      page: dto.page,
      pageSize,
    };
  }

  async getUserDetail(dto: PageDto) {
    const user = await this.userRepository.findOne({
      where: { sequence: dto.sequence },
      select: this.detailSelection,
      relations: {
        devices: true,
      },
    });
    console.log(user);
    return { user, page: dto.page };
  }

  async updateUser(memo: string, userSequence: number, page: number) {
    const user = await this.userRepository.update(
      { sequence: userSequence },
      { memo },
    );
    return { user, page };
  }

  async deleteRefreshToken(dto: PageDto) {
    const user = await this.userRepository.update(
      { sequence: dto.sequence },
      { refreshToken: null },
    );
    return { user, page: dto.page };
  }

  async deleteUserDevice(
    deviceToken: string,
    deviceName: string,
    deviceModel: string,
    deviceType: DeviceType,
    page: number,
  ) {
    await this.userDeviceRepository.delete({
      deviceToken,
      deviceName,
      deviceModel,
      deviceType,
    });
    return { page };
  }
}
