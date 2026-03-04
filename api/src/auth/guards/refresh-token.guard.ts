import { 
  CanActivate, 
  ExecutionContext, 
  Injectable, 
  UnauthorizedException 
} from '@nestjs/common';
import { CertTokenService } from '../cert-token.service';
import { RefreshTokenStatus } from '../cert-token.service'; // Enum 위치 확인 필요

@Injectable()
export class RefreshTokenGuard implements CanActivate {
  constructor(private readonly certTokenService: CertTokenService) {}

  async canActivate(context: ExecutionContext): Promise<boolean> {
    const request = context.switchToHttp().getRequest();
    
    // 1. 헤더에서 토큰 추출 (헤더 키는 자동으로 소문자 처리됨)
    const token = request.headers['refreshtoken']; 

    if (!token) {
      throw new UnauthorizedException('Refresh Token이 헤더에 없습니다.');
    }

    // 2. CertTokenService를 통해 복호화 및 검증
    const payload = await this.certTokenService.decodeToken(token);

    // 3. 상태 확인
    if (payload.status === RefreshTokenStatus.EXPIRED) {
      throw new UnauthorizedException('Refresh Token이 만료되었습니다. 다시 로그인해주세요.');
    }

    if (payload.status === RefreshTokenStatus.INVALID || !payload.uuid) {
      throw new UnauthorizedException('유효하지 않은 Refresh Token입니다.');
    }

    // 4. 요청 객체에 정보 심어주기 (컨트롤러에서 쓸 수 있게)
    // Refresh Token은 보통 DB 조회가 필요하므로 UUID와 원본 토큰을 넘김
    request.user = {
      uuid: payload.uuid,
      refreshToken: token, 
    };

    return true;
  }
}