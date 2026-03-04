// import { AccessTokenPayload } from "src/auth/cert-token.service";

// declare global {
//   interface Request {
//     toUser(): AccessTokenPayload | null;
//   }
// }

// Request.prototype.toUser = function(): AccessTokenPayload | null {
//   const user = this['user'];
//   if (!user) {
//     return null;
//   }
//   return user as AccessTokenPayload;
// }

import { request } from 'express'; // 👈 express의 원본 프로토타입 객체
import { AccessTokenPayload } from 'src/auth/cert-token.service';

(request as any).toUser = function (): AccessTokenPayload | null {
  // this는 현재 요청 객체(req)를 가리킵니다.
  const user = this.user;
  
  if (!user) {
    return null;
  }
  
  return user as AccessTokenPayload;
};