import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Query,
  Render,
} from '@nestjs/common';
import { DisplayService } from './display.service';
import { DeviceType } from 'src/types/device.type';
import { AppVersionDto } from './dto/app-version.dto';

@Controller('display')
export class DisplayController {
  constructor(private readonly displayService: DisplayService) {}

  @Get('/banner')
  @Render('display/banner_list.hbs')
  async getBanner() {
    return [];
  }

  @Get('/update-app')
  @Render('display/update_app_list.hbs')
  async getUpdateApp() {
    return {};
  }

  @Get('/update-app/list')
  async getAppVersionList(@Query('type') type?: DeviceType) {
    var deviceType = type || DeviceType.IOS;
    return await this.displayService.getAppVersionList(deviceType);
  }

  @Post('/update-app/add')
  async addAppVersion(@Body() dto: AppVersionDto) {
    return await this.displayService.addAppVersion(dto);
  }

  @Delete('/update-app/:sequence/:type')
  async deleteAppVersion(
    @Param('sequence') sequence: number,
    @Param('type') type: DeviceType,
  ) {
    return await this.displayService.deleteAppVersion(sequence, type);
  }
}
