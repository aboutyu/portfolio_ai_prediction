import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
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

  private readonly listSelection = {
    sequence: true,
    userId: true,
    username: true,
    lastLogin: true,
  } as const;

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

  async getUsers(page: number) {
    const skip = page * pageSize;

    const [items, total] = await this.userRepository
      .createQueryBuilder('user')
      // 관계 데이터의 개수를 가상 컬럼에 매핑
      .loadRelationCountAndMap('user.deviceCount', 'user.devices')
      .loadRelationCountAndMap('user.foodLogCount', 'user.foodLogs')
      .loadRelationCountAndMap('user.healthLogCount', 'user.healthLogs')
      .orderBy('user.createDate', 'DESC')
      .skip(skip)
      .take(pageSize)
      .getManyAndCount();

    return {
      items,
      total,
      page,
      pageSize,
    };
  }

  async getUserDetail(userSequence: number, page: number) {
    const user = await this.userRepository.findOne({
      where: { sequence: userSequence },
      select: this.detailSelection,
      relations: {
        devices: true,
      },
    });
    console.log(user);
    return { user, page };
  }

  async updateUser(memo: string, userSequence: number, page: number) {
    const user = await this.userRepository.update(
      { sequence: userSequence },
      { memo },
    );
    return { user, page };
  }

  async deleteRefreshToken(userSequence: number, page: number) {
    const user = await this.userRepository.update(
      { sequence: userSequence },
      { refreshToken: null },
    );
    return { user, page };
  }

  async deleteUserDevice(
    deviceToken: string,
    deviceName: string,
    deviceModel: string,
    deviceType: DeviceType,
    createDate: Date,
    page: number,
  ) {
    const device = await this.userDeviceRepository.delete({
      deviceToken,
      deviceName,
      deviceModel,
      deviceType,
    });
    return { page };
  }
}
