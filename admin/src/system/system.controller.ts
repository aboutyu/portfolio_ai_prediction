import { Body, Controller, Get, Post, Query, Render } from '@nestjs/common';
import { SystemService } from './system.service';
import { ServiceInfoDto } from './dto/service-info.dto';

@Controller('system')
export class SystemController {
  constructor(private readonly systemService: SystemService) {}

  @Get('/serviceInfo')
  @Render('system/service_info.hbs')
  async getCompanyInfo(@Query() lang?: string) {
    const language = lang || 'ko';
    return this.systemService.getCompanyInfo(language);
  }

  @Post('/serviceInfo/update')
  async updateServiceInfo(@Body() dto: ServiceInfoDto) {
    console.log('업데이트 요청 데이터:', dto);
    return await this.systemService.updateServiceInfo(dto);
  }
}
