import { Controller, Get, Req, Res } from '@nestjs/common';
import type { Request, Response } from 'express';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get('/')
  root(@Req() req: Request, @Res() res: Response) {
    const isLogin = !!req.session?.sequence;

    if (isLogin) {
      return res.redirect('/dashboard');
    }

    return res.redirect('/login');
  }
}
