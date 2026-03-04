// src/middleware/global.middleware.ts
import { Injectable, NestMiddleware } from '@nestjs/common';
import { Request, Response, NextFunction } from 'express';

@Injectable()
export class GlobalMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: NextFunction) {
    res.locals.defaultInfo = {
      title: 'AI Prediction Admin',
      description: '헬스케어S AI 예측 서비스 관리자 페이지',
    };
    next();
  }
}
