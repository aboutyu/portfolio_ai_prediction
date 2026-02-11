import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import { from, Observable } from 'rxjs';
import { map, switchMap } from 'rxjs/operators';
import { Response } from 'express';
import { service } from '../constants';
import session from 'express-session';
import { InjectRepository } from '@nestjs/typeorm';
import { ServiceInfo } from 'src/entities/service-info.entity';
import { Repository } from 'typeorm';

@Injectable()
export class TemplateVarsInterceptor implements NestInterceptor {
  constructor(
    @InjectRepository(ServiceInfo)
    private readonly serviceInfoRepository: Repository<ServiceInfo>,
  ) {}

  // 메뉴 별 네비게이션 타이틀 설정
  private readonly naviagator = {
    '/dashboard': { top_menu: '', sub_menu: '대시보드' },
    '/users': { top_menu: '회원관리', sub_menu: '목록' },
    '/users/detail': { top_menu: '회원관리', sub_menu: '상세' },
    '/cs/notice': { top_menu: '고객센터', sub_menu: '공지사항' },
    '/cs/notice/detail': { top_menu: '고객센터', sub_menu: '공지사항 상세' },
    '/cs/qna': { top_menu: '고객센터', sub_menu: '1:1문의' },
    '/cs/faq/detail': { top_menu: '고객센터', sub_menu: 'FAQ 상세' },
    '/cs/faq': { top_menu: '고객센터', sub_menu: 'FAQ' },

    '/system/adminuser': { top_menu: '시스템관리', sub_menu: '어드민계정' },
    '/system/eula': { top_menu: '시스템관리', sub_menu: '약관등록' },
    '/system/serviceInfo': { top_menu: '시스템관리', sub_menu: '서비스 정보' },
  };

  intercept(context: ExecutionContext, next: CallHandler): Observable<any> {
    const request = context.switchToHttp().getRequest();
    const session = request.session;
    const urlPath = request.path;

    // 1. DB에서 서비스 정보를 비동기로 조회 (현재 언어 설정이 ko인 것을 예시로 함)
    return from(
      this.serviceInfoRepository.findOne({ where: { language: 'ko' } }),
    ).pipe(
      switchMap((service) => {
        const commonData = {
          profile: {
            adminName: session.adminName || 'Guest',
            adminId: session.adminId || 'none',
            adminSequence: session.adminSequence || 'none',
            adminCreateTime: session.adminCreateTime || '-',
          },
          service,
          navigator: this.naviagator[urlPath] || { top_menu: '', sub_menu: '' },
        };

        return next.handle().pipe(
          map((data) => {
            return { ...commonData, ...data };
          }),
        );
      }),
    );
  }
}
