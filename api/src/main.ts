import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { NestExpressApplication } from '@nestjs/platform-express';
import { DataSource } from 'typeorm';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  // 데이터베이스 연결
  const dataSource = app.get(DataSource);

  // Swagger 설정
  const swaggerConfig = new DocumentBuilder()
    .setTitle('AI Prediction API Documentation')
    .setDescription('AI 예측 헬스케어 서비스 API 문서입니다.')
    .setVersion('1.0.0')
    .setContact('Support Team', '/?lang=ko', 'yu7987j@naver.com')
    .build();
  const document = SwaggerModule.createDocument(app, swaggerConfig);
  SwaggerModule.setup('api/documents', app, document);

  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
