import {
  Injectable,
  NestInterceptor,
  ExecutionContext,
  CallHandler,
} from '@nestjs/common';
import { from, Observable } from 'rxjs';
import { map, switchMap } from 'rxjs/operators';
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
    '/dashboard': {
      top_menu: '',
      sub_menu: '대시보드',
      menuState: 'dashboard',
    },
    '/users': {
      top_menu: '회원관리',
      sub_menu: '목록',
      menuState: 'users',
      subState: '',
    },
    '/users/detail': {
      top_menu: '회원관리',
      sub_menu: '상세',
      menuState: 'users',
      subState: '',
    },
    '/users/admin-users': {
      top_menu: '시스템관리',
      sub_menu: '어드민계정',
      menuState: 'system',
      subState: 'admin-users',
    },
    '/users/admin-users/detail': {
      top_menu: '시스템관리',
      sub_menu: '어드민계정 상세',
      menuState: 'system',
      subState: 'admin-users',
    },

    '/display/banner': {
      top_menu: '전시관리',
      sub_menu: '배너 등록',
      menuState: 'display',
      subState: 'banner',
    },
    '/display/update-app': {
      top_menu: '전시관리',
      sub_menu: '앱버전관리',
      menuState: 'display',
      subState: 'update-app',
    },
    '/cs/notice': {
      top_menu: '고객센터',
      sub_menu: '공지사항',
      menuState: 'cs',
      subState: 'notice',
    },
    '/cs/notice/detail': {
      top_menu: '고객센터',
      sub_menu: '공지사항 상세',
      menuState: 'cs',
      subState: 'notice',
    },
    '/cs/qna': {
      top_menu: '고객센터',
      sub_menu: '1:1문의',
      menuState: 'cs',
      subState: 'qna',
    },
    '/cs/faq/detail': {
      top_menu: '고객센터',
      sub_menu: 'FAQ 상세',
      menuState: 'cs',
      subState: 'faq',
    },
    '/cs/faq': {
      top_menu: '고객센터',
      sub_menu: 'FAQ',
      menuState: 'cs',
      subState: 'faq',
    },

    '/system/eula': {
      top_menu: '시스템관리',
      sub_menu: '약관등록',
      menuState: 'system',
      subState: 'eula',
    },
    '/system/eula/detail': {
      top_menu: '시스템관리',
      sub_menu: '약관등록 상세',
      menuState: 'system',
      subState: 'eula',
    },
    '/system/serviceInfo': {
      top_menu: '시스템관리',
      sub_menu: '서비스 정보',
      menuState: 'system',
      subState: 'serviceInfo',
    },
    '/system/rawdata': {
      top_menu: '시스템관리',
      sub_menu: '기초데이터',
      menuState: 'system',
      subState: 'rawdata',
    },
    '/system/devices': {
      top_menu: '시스템관리',
      sub_menu: '등록디바이스',
      menuState: 'system',
      subState: 'devices',
    },
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
          navigator: this.naviagator[urlPath] || {
            top_menu: '',
            sub_menu: '',
            menuState: '',
          },
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
