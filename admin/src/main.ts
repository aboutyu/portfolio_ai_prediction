import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { join } from 'path';
import { AppModule } from './app.module';
import * as exphbs from 'express-handlebars'; // express-handlebars import
import * as Handlebars from 'handlebars'; // handlebars import
import { registerHandlebarsHelpers } from './helpers/middlewares/helpers.middleware';
import { DataSource } from 'typeorm';
import session from 'express-session';
import { TemplateVarsInterceptor } from './helpers/intercepts/template-engine-variables.intercept';
import { ValidationPipe } from '@nestjs/common/pipes/validation.pipe';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  // 데이터베이스 연결
  const dataSource = app.get(DataSource);

  // template engine 설정
  const hbs = exphbs.create({
    extname: 'hbs', // 파일 확장자
    defaultLayout: 'layout', // 기본 레이아웃 파일 (partials/layout.hbs)
    layoutsDir: join(__dirname, '..', 'views/partials'), // 레이아웃 파일 경로
    partialsDir: join(__dirname, '..', 'views/partials'), // 파셜 파일 경로
  });
  registerHandlebarsHelpers(hbs.handlebars as typeof Handlebars); // 헬퍼 등록
  app.useStaticAssets(join(__dirname, '..', 'public'));
  app.setBaseViewsDir(join(__dirname, '..', 'views'));
  app.engine('hbs', hbs.engine); // hbs 엔진을 사용
  app.setViewEngine('hbs');

  // 전역 인터셉터 등록
  app.useGlobalInterceptors(new TemplateVarsInterceptor());
  app.useGlobalPipes(
    new ValidationPipe({
      transform: true,
      transformOptions: { enableImplicitConversion: true },
    }),
  );

  app.use(
    session({
      secret: process.env.SESSION_SECRET_KEY || 'secret',
      resave: false,
      saveUninitialized: false,
      cookie: {
        maxAge: 1000 * 60 * 60, // 1시간
      },
    }),
  );

  const port = process.env.PORT || 8080;
  console.log(`🚀 Application is running on: ${port}`);
  await app.listen(port);
}
bootstrap();
