import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ServiceInfo } from 'src/entities/service-info.entity';
import { Repository } from 'typeorm';
import { ServiceInfoDto } from './dto/service-info.dto';
import { EULA_LIST } from 'src/types/terms.type';
import { Terms } from 'src/entities/terms.entity';
import { EulaDto } from './dto/eula.dto';
import { EulaDataDto } from './dto/eula-data.dto';

@Injectable()
export class SystemService {
  constructor(
    @InjectRepository(Terms)
    private readonly termsRepository: Repository<Terms>,

    @InjectRepository(ServiceInfo)
    private readonly serviceInfoRepository: Repository<ServiceInfo>,
  ) {}

  async getEula() {
    const eulaCount = await this.termsRepository
      .createQueryBuilder('eula')
      .select('eula.type', 'type') // 그룹화할 컬럼 선택
      .addSelect('COUNT(eula.type)', 'count') // 개수 계산
      .groupBy('eula.type') // type 기준으로 그룹화
      .getRawMany(); // 집계 함수를 쓸 때는 getRawMany를 사용해야 합니다.

    const eulaList = EULA_LIST.map((eula) => {
      const count =
        eulaCount.find((item) => item.type === eula.type)?.count || 0;
      return { ...eula, count };
    });

    return { eulaList };
  }

  async getEulaDetail(dto: EulaDto) {
    const eula = await this.termsRepository.find({
      where: { type: dto.type },
      order: { startDate: 'DESC' },
    });
    const country = await this.termsRepository.find({
      where: { type: dto.type },
      select: ['language'],
    });
    return { eula, country, type: dto.type, lang: dto.lang };
  }

  async addEula(dto: EulaDataDto) {
    const data = dto;
    data.sequence = undefined;

    const newEula = this.termsRepository.create(data);
    return await this.termsRepository.save(newEula);
  }

  async modifyEula(dto: EulaDataDto) {
    if (!dto.sequence) {
      return null;
    }

    const sequence = dto.sequence!;
    const data = dto;
    data.sequence = undefined;

    const existingEula = await this.termsRepository.findOne({
      where: { sequence: sequence },
    });

    if (!existingEula) {
      return null;
    }

    return await this.termsRepository.update(sequence, data);
  }

  async getCompanyInfo(lang: string) {
    const item = await this.serviceInfoRepository.find();
    return { item, lang };
  }

  async updateServiceInfo(dto: ServiceInfoDto) {
    let serviceInfo = await this.serviceInfoRepository.findOne({
      where: { language: dto.language },
    });

    if (!serviceInfo) {
      return null;
    }

    return await this.serviceInfoRepository.update(serviceInfo.language, {
      serviceName: dto.serviceName,
      companyName: dto.companyName,
      ceoName: dto.ceoName,
      privateManagerName: dto.privateManagerName,
      companyNumber: dto.companyNumber,
      telecomSellerNumber: dto.telecomSellerNumber,
      companyAddress: dto.companyAddress,
      companyZipcode: dto.companyZipcode,
      phone: dto.phone,
      memo: dto.memo,
      copyright: dto.copyright,
      companyUrl: dto.companyUrl,
      serviceUrl: dto.serviceUrl,
      email: dto.email,
    });
  }
}
