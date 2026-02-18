import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { AppVersion } from 'src/entities/app-version.entity';
import { ServiceCode } from 'src/entities/service-code.entity';
import { ServiceInfo } from 'src/entities/service-info.entity';
import { PlatformType } from 'src/helpers/enums/platform-type.enum';
import { ServiceCodeType } from 'src/helpers/enums/service-code-type.enum';
import { successResponse } from 'src/helpers/enums/status.enum';
import { Repository } from 'typeorm';

@Injectable()
export class SystemService {
  constructor(
    @InjectRepository(AppVersion)
    private readonly appVersionRepository: Repository<AppVersion>,

    @InjectRepository(ServiceInfo)
    private readonly serviceInfoRepository: Repository<ServiceInfo>,

    @InjectRepository(ServiceCode)
    private readonly serviceCodeRepository: Repository<ServiceCode>,
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

  async getServiceCode(type: ServiceCodeType) {
    const serviceCodes = await this.serviceCodeRepository.find({
      select: {
        sequence: true,
        type: true,
        code: true,
        name: true,
      },
      where: { type, isActivate: true },
    });
    return successResponse(serviceCodes);
  }
}
