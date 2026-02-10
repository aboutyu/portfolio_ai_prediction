import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/entities/user.entity';
import { pageSize } from 'src/helpers/constants';
import { DataSource, Repository } from 'typeorm';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
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

  async getUserDetail(userSequence: number) {
    return this.userRepository.findOne({
      where: { sequence: userSequence },
      select: this.detailSelection,
    });
  }
}
