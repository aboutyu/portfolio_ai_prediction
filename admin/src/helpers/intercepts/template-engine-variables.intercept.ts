import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Response } from 'express';
import { service } from '../constants';
import session from 'express-session';

@Injectable()
export class TemplateVarsInterceptor implements NestInterceptor {
  // 메뉴 별 네비게이션 타이틀 설정
  private readonly naviagator = {
    '/dashboard': { top_menu: '', sub_menu: '대시보드' },
    '/users': { top_menu: '', sub_menu: '회원관리' },
  };

  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    const response = context.switchToHttp().getResponse<Response>();
    const request = context.switchToHttp().getRequest();
    const session = request.session;
    const urlPath = request.path; // 현재 요청된 URL

    // 공통 데이터 정의 (DB나 ConfigService에서 가져올 수 있음)
    const commonData = {
      profile: {
        adminName: session.adminName || 'Guest',
        adminId: session.adminId || 'none',
        adminSequence: session.sequence || 'none',
        adminCreateTime: session.createTime || '-',
      },
      service: {
        service_name: service.service_name,
        company_name: service.company_name,
        ceo_name: service.ceo_name,
        trade_year: service.trade_year,
      },
      navigator: this.naviagator[urlPath] || { top_menu: '', sub_menu: '' },
    };

    return next.handle().pipe(
      map((data) => {
        console.log(
          'TemplateVarsInterceptor - Merging template variables',
          commonData,
          data,
        );
        return { ...commonData, ...data };
      }),
    );
  }
}
