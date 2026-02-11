import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ServiceInfo } from 'src/entities/service-info.entity';
import { Repository } from 'typeorm';
import { ServiceInfoDto } from './dto/service-info.dto';

@Injectable()
export class SystemService {
  constructor(
    @InjectRepository(ServiceInfo)
    private readonly serviceInfoRepository: Repository<ServiceInfo>,
  ) {}

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
