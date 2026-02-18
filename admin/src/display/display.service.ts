import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { AppVersion } from 'src/entities/app-version.entity';
import { DeviceType } from 'src/types/device.type';
import { Repository } from 'typeorm';
import { AppVersionDto } from './dto/app-version.dto';

@Injectable()
export class DisplayService {
  constructor(
    @InjectRepository(AppVersion)
    private readonly appVersionRepository: Repository<AppVersion>,
  ) {}

  async getBannerList() {
    return [];
  }

  async getAppVersionList(type: DeviceType) {
    const [items, total] = await this.appVersionRepository.findAndCount({
      where: { type },
      order: {
        createDate: 'DESC',
      },
    });
    return { items, total, type };
  }

  async addAppVersion(dto: AppVersionDto) {
    const saveItem = this.appVersionRepository.create(dto);
    const item = await this.appVersionRepository.save(saveItem);
    return { item, type: dto.type };
  }

  async deleteAppVersion(sequence: number, type: DeviceType) {
    const item = await this.appVersionRepository.delete({ sequence, type });
    return { item, type };
  }
}
