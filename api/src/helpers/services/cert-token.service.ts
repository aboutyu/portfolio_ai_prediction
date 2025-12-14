import { Injectable } from "@nestjs/common";
import { RoleType } from "../enums/role-type.enum";
import { JwtService } from "@nestjs/jwt";
import * as crypto from 'crypto';

export interface AccessTokenPayload {
  userSequence: number;
  userId: string;
  username: string;
  role: RoleType;
}

export interface RefreshTokenPayload {
  refreshToken: string;
  uuid: string;
  expiresAt: Date;
}

@Injectable()
export class CertTokenService {
  constructor(
    private readonly jwtService: JwtService,
  ) { }

  // .env로 빼야 하는 값들
  private readonly jwtAccessSecret = 'process.env.JWT_ACCESS_SECRET'; // Access Token 서명용 비밀키
  private readonly algorithm = 'aes-256-cbc'; // 암호화 알고리즘
  private readonly secretKey = process.env.REFRESH_TOKEN_SECRET || '12345678901234567890123456789012'; // 32byte 필수
  private readonly ivLength = 16; // AES 초기화 벡터 크기
  
  // Access Token 발급(수명 1시간)
  async makeAccessToken(
    userSequence: number,
    userId: string,
    username: string,
    role: RoleType = RoleType.USER_ROLE): Promise<string> {
    const payload: AccessTokenPayload = {
      userSequence,
      userId,
      username,
      role
    };

    return this.jwtService.signAsync(
      payload, {
        secret: this.jwtAccessSecret,
        expiresIn: '1h',
      });
  }

  // Access Token 검증 및 페이로드 반환
  async verifyAccessToken(token: string): Promise<AccessTokenPayload | null> {
    try {
      const payload = await this.jwtService.verifyAsync(
        token, {
        secret: this.jwtAccessSecret,
      });
      return payload;
    } catch (error) {
      return null;
    }
  }

  /*
    1. Refresh Token 발급(수명 2주(14일)),
    2. Access Token 재발급 시 사용(로그인/자동로그인 시 발급하며, 로그아웃/회원탈퇴 시 폐기)
    3. Refresh Token은 UUID(난수)와 생성시간으로 구성되고, 해독 불가능하게 처리
    4. 검증은 1) 생성시간 기준 14일 2) DB에 저장된 UUID(난수)와 비교
  */
  async makeRefreshToken(): Promise<RefreshTokenPayload> {
    const uuid = crypto.randomUUID();
    const expirationTime = Date.now() + 1000 * 60 * 60 * 24 * 14; // 14일 후 만료
    const payload = `${uuid}:${expirationTime}`; // A. 페이로드: "난수:만료시간(밀리초)"

    // D. 암호화 수행
    const iv = crypto.randomBytes(this.ivLength); // 매번 변하는 초기화 벡터
    const cipher = crypto.createCipheriv(this.algorithm, Buffer.from(this.secretKey), iv);
    
    let encrypted = cipher.update(payload, 'utf8', 'hex');
    encrypted += cipher.final('hex');

    // E. 최종 토큰: "IV값:암호화된값" (복호화 할 때 IV가 필요함)
    const token = `${iv.toString('hex')}:${encrypted}`;

    // F. 리턴: 토큰(클라이언트용), UUID(DB저장용), 만료일(DB저장용)
    return {
      refreshToken: token,
      uuid,
      expiresAt: new Date(expirationTime),
    };
  }

  /**
   * 4. 토큰 내용 조회 (검증 없이 내용만 확인)
   * - 만료된 토큰이어도 안에 있는 userSequence를 알고 싶을 때 사용
   */
  async decodeToken(refreshToken: string): Promise<RefreshTokenStatusPayload> {
    try {
      // A. 토큰 형식 체크 (IV:Content)
      if (!refreshToken || !refreshToken.includes(':')) {
        return this.createInvalidPayload();
      }

      const [ivHex, encryptedData] = refreshToken.split(':');

      // B. 복호화 수행 (crypto 사용)
      const iv = Buffer.from(ivHex, 'hex');
      const decipher = crypto.createDecipheriv(this.algorithm, Buffer.from(this.secretKey), iv);
      
      let decrypted = decipher.update(encryptedData, 'hex', 'utf8');
      decrypted += decipher.final('utf8');

      // C. 데이터 파싱 ("UUID:만료타임스탬프")
      const [uuid, expiresAtStr] = decrypted.split(':');
      const expiresAtNum = Number(expiresAtStr);

      // 데이터가 깨져있거나 숫자가 아니면 INVALID
      if (!uuid || isNaN(expiresAtNum)) {
        return this.createInvalidPayload();
      }

      const expiresAt = new Date(expiresAtNum);

      // D. 만료 시간 체크
      if (Date.now() > expiresAtNum) {
        return { 
          status: RefreshTokenStatus.EXPIRED, 
          uuid, 
          expiresAt 
        };
      }

      return { 
        status: RefreshTokenStatus.VALID, 
        uuid, 
        expiresAt 
      };
    } catch (error) {
      return this.createInvalidPayload();
    }
  }

  // 유효하지 않은 경우의 리턴값
  private createInvalidPayload(): RefreshTokenStatusPayload {
    return {
      status: RefreshTokenStatus.INVALID,
      uuid: '', // or null (인터페이스에 따라 조정)
      expiresAt: new Date(0), // 1970-01-01 (이미 만료된 시간)
    };
  }
}

export enum RefreshTokenStatus {
  VALID, // 유효, 서버로직은 함수 밖에서 처리해야 함
  EXPIRED, // 만료
  INVALID, // 형식오류 등 유효하지 않음
}

export interface RefreshTokenStatusPayload {
  status: RefreshTokenStatus;
  uuid: string;
  expiresAt: Date;
}
