import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { NestExpressApplication } from '@nestjs/platform-express';
import { DataSource } from 'typeorm';
import { SwaggerModule } from '@nestjs/swagger';
import { swaggerConfig, swaggerUrl } from './configures/swagger';

import './helpers/extensions/string.extensions';
import './helpers/extensions/request.extension';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  // 데이터베이스 연결
  app.get(DataSource);
  app.enableCors({
    origin: '*',
    methods: 'GET,HEAD,PUT,PATCH,POST,DELETE,OPTIONS',
    preflightContinue: false,
    optionsSuccessStatus: 204,
    credentials: true,
  });

  // Swagger 설정 부분
  // if (process.env.NODE_ENV !== 'production') {
  console.log(`🚀 Swagger is running at  ${swaggerUrl}`);
  const document = SwaggerModule.createDocument(app, swaggerConfig);
  SwaggerModule.setup(swaggerUrl, app, document);
  // }

  const port = process.env.PORT || 3000;
  console.log(`🚀 Application is running on: ${port}`);
  await app.listen(port);
}
bootstrap();
