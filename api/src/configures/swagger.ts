import { DocumentBuilder } from '@nestjs/swagger';

export const swaggerUrl = '/api/documents';
const swaggerPrefix = process.env.NODE_ENV === 'development' ? '/web' : '/';

export const swaggerConfig = new DocumentBuilder()
  .setTitle('AI Prediction API Documentation')
  .setDescription('AI 예측 헬스케어 서비스 API 문서입니다.')
  .setVersion('1.0.0')
  .setContact('Support Team', '/?lang=ko', 'yu7987j@naver.com')
  .addBearerAuth(
    {
      type: 'http',
      scheme: 'bearer',
      bearerFormat: 'JWT',
      name: 'JWT',
      description: '로그인 후 발급받은 Access Token을 입력하세요.',
      in: 'header',
    },
    'access-token',
  )
  .addGlobalParameters(
    {
      name: 'accept-language',
      in: 'header',
      required: false,
      schema: { type: 'string', default: 'ko' },
      description: '언어 설정 (ko, en 등)',
    },
    {
      name: 'x-timezone',
      in: 'header',
      required: false,
      schema: { type: 'string', default: 'Asia/Seoul' },
      description: '타임존 정보',
    },
    {
      name: 'x-platform',
      in: 'header',
      required: false,
      schema: { type: 'string', enum: ['IOS', 'AOS'], default: 'IOS' },
      description: '플랫폼 구분',
    },
  )
  .addApiKey(
    {
      type: 'apiKey',
      name: 'refreshtoken',
      in: 'header',
      description:
        'Access Token 재발급을 위한 Refresh Token으로 현재는 사용하지 않음.',
    },
    'refresh-token',
  )
  .addServer(swaggerPrefix)
  .addSecurityRequirements('access-token')
  .build();
