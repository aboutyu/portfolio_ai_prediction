import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { AppVersion } from 'src/entities/app-version.entity';
import { ServiceInfo } from 'src/entities/service-info.entity';
import { PlatformType } from 'src/helpers/enums/platform-type.enum';
import { successResponse } from 'src/helpers/enums/status.enum';
import { In, Repository } from 'typeorm';

@Injectable()
export class SystemService {
  constructor(
    @InjectRepository(AppVersion)
    private readonly appVersionRepository: Repository<AppVersion>,

    @InjectRepository(ServiceInfo)
    private readonly serviceInfoRepository: Repository<ServiceInfo>,
  ) {}

  async getAppUpdateInfo(platform: PlatformType) {
    const updateInfo = await this.appVersionRepository.findOne({
      select: {
        type: true,
        isEssential: true,
        version: true,
        buildNumber: true,
      },
      where: { type: platform },
      order: { createDate: 'DESC' },
    });

    return successResponse(updateInfo);
  }

  async getServiceInfo(locale: string) {
    const serviceInfo = await this.serviceInfoRepository.findOne({
      where: { language: locale },
    });
    return successResponse(serviceInfo);
  }
}
