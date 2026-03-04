import { Injectable, UnauthorizedException } from '@nestjs/common';
import { PassportStrategy } from '@nestjs/passport';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { ConfigService } from '@nestjs/config';
import { CertTokenService } from './cert-token.service';

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy, 'jwt') { 
  constructor(
    private readonly certTokenService: CertTokenService,
    private readonly configService: ConfigService,
  ) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(), // 헤더의 Authorization: Bearer ... 에서 토큰 추출
      ignoreExpiration: false,  // 만료된 토큰이면 거절 (401 에러)
      secretOrKey: configService.get<string>('JWT_ACCESS_SECRET') || '', // 검증 비밀키 (.env에서 가져옴)
    });
  }

  async validate(payload: any) {
    // 페이로드가 유효하지 않으면 거절 (401 에러)
    if (!payload) {
      throw new UnauthorizedException('Invalid access token payload');
    }
    return payload; // 페이로드를 요청 객체에 첨부 (req.user)
  }
}