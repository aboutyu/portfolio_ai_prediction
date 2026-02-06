import * as crypto from 'crypto';

export function hashSHA256(value: string): string {
  return crypto.createHash('sha256').update(value).digest('hex');
}
