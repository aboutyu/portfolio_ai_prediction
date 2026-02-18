import { Body, Controller, Get, Post, Query, Render } from '@nestjs/common';
import { SystemService } from './system.service';
import { ServiceInfoDto } from './dto/service-info.dto';
import { EulaDto } from './dto/eula.dto';
import { EulaDataDto } from './dto/eula-data.dto';
import { PageDto } from 'src/dto/page.dto';
import { ServiceCodeDto } from './dto/service-code.dto';
import { ServiceCodeType } from 'src/types/service-code.type';

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
    return this.systemService.addEula(dto);
  }

  @Post('/eula/modify')
  async modifyEula(@Body() dto: EulaDataDto) {
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

  @Get('/rawdata/food-nutrition-info')
  async getFoodNutritionInfo(@Query() dto: PageDto) {
    return await this.systemService.getFoodNutritionInfo(dto);
  }

  @Get('/rawdata/service-codes')
  async getServiceCodes(@Query('type') type: ServiceCodeType) {
    return await this.systemService.getServiceCodes(type);
  }

  @Post('/rawdata/service-codes/add')
  async addServiceCodes(@Body() dto: ServiceCodeDto) {
    return await this.systemService.addServiceCodes(dto);
  }

  @Post('/rawdata/service-codes/modify')
  async modifyServiceCodes(@Body() dto: ServiceCodeDto) {
    return await this.systemService.modifyServiceCodes(dto);
  }
}
