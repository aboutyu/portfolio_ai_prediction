import { Controller, Get, Query, Render } from '@nestjs/common';
import { UsersService } from './users.service';
import { PageDto } from 'src/dto/page.dto';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get('')
  @Render('users/user_list.hbs')
  async getUsers(@Query() pageDto: PageDto) {
    return await this.usersService.getUsers(pageDto.page);
  }

  @Get('/detail')
  @Render('users/user_detail.hbs')
  async getUserDetail(@Query() pageDto: PageDto) {
    if (!pageDto.sequence) {
      throw new Error('User sequence is required');
    }
    return await this.usersService.getUserDetail(pageDto.sequence);
  }
}
