import { createParamDecorator, ExecutionContext } from '@nestjs/common';
import { PlatformType } from '../enums/platform-type.enum';

export class HeaderInfo {
  locale: string;
  platform: PlatformType;
  timezone: string;
}

export const GetHeaderInfo = createParamDecorator(
  (data: unknown, ctx: ExecutionContext): HeaderInfo => {
    const request = ctx.switchToHttp().getRequest();
    const headers = request.headers;

    const info = new HeaderInfo();
    info.locale = headers['accept-language'] || 'ko';
    info.platform = headers['x-platform'] as PlatformType;
    info.timezone = headers['x-timezone'] as string;

    console.log('-----------------------------------');
    console.log('TemplateVarsInterceptor - Intercepting request...');
    console.log('Locale:', info.locale);
    console.log('Timezone:', info.timezone);
    console.log('Platform:', info.platform);
    console.log('-----------------------------------');

    return info;
  },
);
