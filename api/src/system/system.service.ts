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

  async getServiceCode() {
    const query = `
    SELECT 
        sc.code AS code, 
        sc.type AS type,
        sc.code_name AS codeName,
        t_agg.names AS names
    FROM service_code sc
    LEFT JOIN (
        SELECT 
            service_code_sequence,
            JSON_OBJECTAGG(language, name) AS names
        FROM service_code_translation
        GROUP BY service_code_sequence
    ) t_agg ON t_agg.service_code_sequence = sc.sequence
    WHERE sc.is_activate = 'Y'
  `;

    const rawResults = await this.serviceCodeRepository.query(query);

    const groupedObject = rawResults.reduce(
      (acc, item) => {
        const { type } = item;

        // 해당 type의 그룹이 없으면 새로 생성
        if (!acc[type]) {
          acc[type] = {
            code: type,
            items: [],
          };
        }

        // 해당 그룹의 data 배열에 현재 아이템 추가
        acc[type].items.push({
          code: item.code,
          codeName: item.codeName,
          type: item.type,
          names: item.names,
        });

        return acc;
      },
      {} as Record<string, any>,
    );
    const serviceCodes = Object.values(groupedObject);
    return successResponse(serviceCodes);
  }
}
