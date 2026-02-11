import { Body, Controller, Get, Post, Query, Render } from '@nestjs/common';
import { UsersService } from './users.service';
import { PageDto } from 'src/dto/page.dto';
import { DeviceDto } from './dto/device.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get('')
  @Render('users/user_list.hbs')
  async getUsers(@Query() dto: PageDto) {
    return await this.usersService.getUsers(dto);
  }

  @Get('/detail')
  @Render('users/user_detail.hbs')
  async getUserDetail(@Query() dto: PageDto) {
    if (!dto.sequence) {
      throw new Error('User sequence is required');
    }
    return await this.usersService.getUserDetail(dto);
  }

  @Post('/update')
  async updateUser(@Body() memo: string, @Body() dto: PageDto) {
    if (!dto.sequence) {
      throw new Error('User sequence is required');
    }
    return await this.usersService.updateUser(memo, dto.sequence, dto.page);
  }

  @Post('/delete/refreshToken')
  async deleteRefreshToken(@Body() dto: PageDto) {
    if (!dto.sequence) {
      throw new Error('User sequence is required');
    }
    const userDetail = await this.usersService.getUserDetail(dto);
    const user = userDetail.user;
    if (!user) {
      throw new Error('User not found');
    }
    return await this.usersService.deleteRefreshToken(dto);
  }

  @Post('/delete/device')
  async deleteUserDevice(@Body() dto: DeviceDto & PageDto) {
    if (
      !dto.deviceToken &&
      !dto.deviceType &&
      !dto.deviceName &&
      !dto.deviceModel &&
      !dto.createDate
    ) {
      throw new Error('Device sequence is required');
    }
    return await this.usersService.deleteUserDevice(
      dto.deviceToken!,
      dto.deviceName!,
      dto.deviceModel!,
      dto.deviceType!,
      dto.page,
    );
  }
}
