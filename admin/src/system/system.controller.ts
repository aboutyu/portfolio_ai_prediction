import { Body, Controller, Get, Post, Query, Render } from '@nestjs/common';
import { SystemService } from './system.service';
import { ServiceInfoDto } from './dto/service-info.dto';
import { EulaDto } from './dto/eula.dto';
import { EulaDataDto } from './dto/eula-data.dto';
import { PageDto } from 'src/dto/page.dto';

@Controller('system')
export class SystemController {
  constructor(private readonly systemService: SystemService) {}

  @Get('/eula')
  @Render('system/eula_list.hbs')
  async getEula() {
    return await this.systemService.getEula();
  }

  @Get('/eula/detail')
  @Render('system/eula_detail.hbs')
  async getEulaDetail(@Query() dto: EulaDto) {
    return await this.systemService.getEulaDetail(dto);
  }

  @Post('/eula/add')
  async addEula(@Body() dto: EulaDataDto) {
    // 여기에 EULA 추가 로직 구현
    console.log('EULA 추가 요청 데이터:', dto);
    return this.systemService.addEula(dto);
  }

  @Post('/eula/modify')
  async modifyEula(@Body() dto: EulaDataDto) {
    // 여기에 EULA 수정 로직 구현
    console.log('EULA 수정 요청 데이터:', dto);
    return this.systemService.modifyEula(dto);
  }

  @Get('/serviceInfo')
  @Render('system/service_info.hbs')
  async getCompanyInfo(@Query('lang') lang?: string) {
    const language = lang || 'ko';
    return this.systemService.getCompanyInfo(language);
  }

  @Post('/serviceInfo/update')
  async updateServiceInfo(@Body() dto: ServiceInfoDto) {
    console.log('업데이트 요청 데이터:', dto);
    return await this.systemService.updateServiceInfo(dto);
  }

  @Get('/rawdata')
  @Render('system/raw-data.hbs')
  async getRawDataList() {
    return {};
  }

  @Get('/rawdata/nutrition-dictionary')
  async getNutritionDictionary() {
    return await this.systemService.getNutritionDictionary();
  }

  @Get('/rawdata/user-devices')
  async getUserDevices(@Query() dto: PageDto) {
    return await this.systemService.getUserDevices(dto);
  }

  @Get('/devices')
  @Render('system/devices.hbs')
  async getRegisteredDevices(@Query() dto: PageDto) {
    return {};
  }
}
