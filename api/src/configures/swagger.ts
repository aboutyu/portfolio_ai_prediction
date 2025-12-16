import { DocumentBuilder } from '@nestjs/swagger';

export const swaggerUrl = '/api/documents';

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
    'access-token', // 👈 이 이름을 기억해두세요 (데코레이터에서 씀)
  )
  // Refresh Token 설정 (커스텀 헤더)
  .addApiKey(
    {
      type: 'apiKey',
      name: 'refreshtoken', // 👈 헤더의 키 이름 (소문자 주의)
      in: 'header',
      description:
        'Access Token 재발급을 위한 Refresh Token으로 현재는 사용하지 않음.',
    },
    'refresh-token', // 👈 보안 스키마 이름 (데코레이터에서 씀)
  )
  .addSecurityRequirements('access-token')
  .build();
