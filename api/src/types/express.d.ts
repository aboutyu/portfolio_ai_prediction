import { AccessTokenPayload } from '../auth/cert-token.service';

declare module 'express' {
  interface Request {
    toUser(): AccessTokenPayload | null;
  }
}
