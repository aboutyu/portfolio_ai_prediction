import { Controller, Get, Req } from '@nestjs/common';
import express from 'express';
import { SystemService } from './system.service';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { AccessTokenPayload } from 'src/auth/cert-token.service';
import { Public } from 'src/auth/decorators/public.decorator';
import {
  GetHeaderInfo,
  HeaderInfo,
} from 'src/helpers/decorators/header-info.decorator';

@ApiTags('시스템 API')
@Controller('system')
export class SystemController {
  constructor(private readonly systemService: SystemService) {}

  @Public()
  @Get('app-update')
  @ApiOperation({
    summary: '앱 업데이트 정보 조회 API',
    description: '앱 업데이트 정보를 조회합니다.',
  })
  async getAppUpdateInfo(@GetHeaderInfo() headerInfo: HeaderInfo) {
    return await this.systemService.getAppUpdateInfo(headerInfo.platform);
  }

  @Public()
  @Get('service-info')
  @ApiOperation({
    summary: '서비스 정보 조회 API',
    description: '서비스 정보를 조회합니다.',
  })
  async getServiceInfo(@GetHeaderInfo() headerInfo: HeaderInfo) {
    return await this.systemService.getServiceInfo(headerInfo.locale);
  }
}
