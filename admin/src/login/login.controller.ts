import { Body, Controller, Get, Post, Render, Req, Res } from '@nestjs/common';
import type { Request, Response } from 'express';
import { LoginService } from './login.service';
import { LoginDto } from 'src/dto/login.dto';

@Controller('/')
export class LoginController {
  constructor(private readonly loginService: LoginService) {}

  // @Public()
  @Get('login')
  @Render('index.hbs')
  async login() {
    return await this.loginService.login();
  }

  @Post('login')
  async loginAction(
    @Body() dto: LoginDto,
    @Req() req: Request,
    @Res() res: Response,
  ) {
    const result = await this.loginService.loginAction(dto);

    req.session.sequence = result.sequence;
    req.session.adminName = result.userName;
    req.session.adminId = result.userId;
    req.session.createTime = result.createTime;

    req.session.save(() => {
      return res.redirect('/');
    });
  }

  @Get('logout')
  async logout(@Req() req: Request, @Res() res: Response) {
    req.session.destroy(() => {
      res.redirect('/');
    });
  }
}
