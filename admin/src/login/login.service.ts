import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { LoginDto } from 'src/dto/login.dto';
import { AdminUser } from 'src/entities/admin.entity';
import { Repository } from 'typeorm';

@Injectable()
export class LoginService {
  constructor(
    @InjectRepository(AdminUser)
    private readonly adminRepository: Repository<AdminUser>,
  ) {}

  private readonly selection = {
    sequence: true,
    userId: true,
    userName: true,
    createTime: true,
  } as const;

  async login() {
    return {
      layout: false,
    };
  }

  async loginAction(dto: LoginDto) {
    const { userId, password } = dto;

    const user = await this.adminRepository.findOne({
      where: { userId, password, isActivate: true },
      select: this.selection,
    });

    return {
      sequence: user?.sequence,
      userId: user?.userId,
      userName: user?.userName,
      createTime: user?.createTime,
    };
  }
}
