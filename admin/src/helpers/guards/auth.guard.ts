import { Injectable, CanActivate, ExecutionContext } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { IS_PUBLIC_KEY } from '../decorators/public.decorator';

@Injectable()
export class SessionAuthGuard implements CanActivate {
  constructor(private reflector: Reflector) {}

  canActivate(context: ExecutionContext): boolean {
    // @Public() 데코레이터가 붙어있는지 확인
    const isPublic = this.reflector.getAllAndOverride<boolean>(IS_PUBLIC_KEY, [
      context.getHandler(),
      context.getClass(),
    ]);

    if (isPublic) return true;

    // 세션 정보 체크
    const request = context.switchToHttp().getRequest();
    const session = request.session;

    if (session && session.adminId && session.sequence) {
      return true;
    }

    // 인증 실패 시 로그인 페이지로 리다이렉트
    const response = context.switchToHttp().getResponse();
    response.redirect('/login'); // 로그인 경로에 맞게 수정하세요.
    return false;
  }
}
