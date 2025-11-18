import { Injectable, NestMiddleware } from '@nestjs/common';
import { Request, Response, NextFunction } from 'express';

declare module 'express-session' {
  interface SessionData {
    name?: string;
    id?: number;
  }
}

@Injectable()
export class GlobalMiddleware implements NestMiddleware {
  use(req: Request, res: Response, next: NextFunction) {
    res.locals.defaultInfo = {
      title: 'AI 예측 서비스 관리자',
      description: 'AI 예측 서비스 관리자 페이지입니다.',
      adminName: req.session?.name || '홍길동', // 🔥 세션 값이 없으면 기본값 사용
      adminSeq: req.session?.id || 1, // 🔥 세션 값이 없으면 기본값 사용
    };
    next();
  }
}
