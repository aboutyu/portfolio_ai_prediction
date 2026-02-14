import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PageDto } from 'src/dto/page.dto';
import { SearchListDto } from 'src/dto/search-list.dto';
import { AdminUser } from 'src/entities/admin-user.entity';
import { UserDevice } from 'src/entities/user-devices.entity';
import { User } from 'src/entities/user.entity';
import { pageSize } from 'src/helpers/constants';
import { DeviceType } from 'src/types/device.type';
import { Brackets, DataSource, Repository } from 'typeorm';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,

    @InjectRepository(UserDevice)
    private readonly userDeviceRepository: Repository<UserDevice>,

    @InjectRepository(AdminUser)
    private readonly adminUserRepository: Repository<AdminUser>,
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

  async getUsers(searchDto: SearchListDto) {
    console.log('Received SearchListDto in getUsers:', searchDto);
    const queryBuilder = this.userRepository.createQueryBuilder('user');

    // 1. 관계 데이터 카운트 매핑
    queryBuilder
      .loadRelationCountAndMap('user.deviceCount', 'user.devices')
      .loadRelationCountAndMap('user.foodLogCount', 'user.foodLogs')
      .loadRelationCountAndMap('user.healthLogCount', 'user.healthLogs');

    // 2. 동적 검색 조건 추가
    // 활성화 여부 검색
    if (searchDto.isActivate !== undefined && searchDto.isActivate !== null) {
      const isActivateValue = searchDto.isActivate ? 'Y' : 'N';
      queryBuilder.andWhere('user.isActivate = :isActivate', {
        isActivate: isActivateValue,
      });
    }

    // 검색어 (이름 또는 이메일 동합 자연어 검색)
    if (searchDto.searchKeyword) {
      const keywords = searchDto.searchKeyword.trim().split(/\s+/); // 공백 기준 단어 분리

      keywords.forEach((word, index) => {
        const paramName = `keyword${index}`;
        queryBuilder.andWhere(
          new Brackets((qb) => {
            qb.where(`user.userName LIKE :${paramName}`, {
              [paramName]: `%${word}%`,
            }).orWhere(`user.userId LIKE :${paramName}`, {
              [paramName]: `%${word}%`,
            });
          }),
        );
      });
    }

    // 로그인 타입 (배열 내 포함 여부 - IN 절)
    // if (searchDto.loginType && searchDto.loginType.length > 0) {
    //   queryBuilder.andWhere('user.loginType IN (:...loginTypes)', {
    //     loginTypes: searchDto.loginType,
    //   });
    // }

    // 3. 정렬 및 페이징 처리
    const [items, total] = await queryBuilder
      .orderBy('user.createDate', 'DESC')
      .skip(searchDto.skip)
      .take(pageSize)
      .getManyAndCount();

    return {
      items,
      total,
      page: searchDto.page,
      pageSize,
      searchDto,
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

  async getAdminUsers(dto: PageDto) {
    const [items, total] = await this.adminUserRepository.findAndCount({
      order: { createTime: 'DESC' },
      skip: dto.skip,
      take: pageSize,
    });

    return {
      items,
      total,
      page: dto.page,
      pageSize,
    };
  }

  async setAdminUser(dto: PageDto, isActivate: boolean) {
    const user = await this.adminUserRepository.update(
      { sequence: dto.sequence },
      { isActivate, password: null },
    );
    return { user, page: dto.page };
  }

  async resetAdminUserPassword(dto: PageDto) {
    const resetPassword = await this.adminUserRepository.findOne({
      select: { userId: true },
      where: { sequence: dto.sequence },
    });

    const user = await this.adminUserRepository.update(
      { sequence: dto.sequence },
      { password: resetPassword?.password || 'admin' },
    );
    return { user, page: dto.page };
  }
}
