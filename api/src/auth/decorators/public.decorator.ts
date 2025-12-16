import { SetMetadata } from '@nestjs/common';

// 인증을 사용하지 않을 데코레이터
export const IS_PUBLIC_KEY = 'isPublic';
export const Public = () => SetMetadata(IS_PUBLIC_KEY, true);
