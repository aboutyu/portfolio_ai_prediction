import { NestFactory } from '@nestjs/core';
import { NestExpressApplication } from '@nestjs/platform-express';
import { join } from 'path';
import { AppModule } from './app.module';
import { sessionConfig } from 'src/configures/session';
import { DataSource } from 'typeorm';
import { cleanupExpiredSessions } from './common/utils/session_cleanup';
import * as exphbs from 'express-handlebars'; // express-handlebars import
import * as Handlebars from 'handlebars'; // handlebars import
import { registerHandlebarsHelpers } from './common/middlewares/helpers.handlebars';

async function bootstrap() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);

  // 데이터베이스 연결
  const dataSource = app.get(DataSource);

  // 세션 설정
  app.use(sessionConfig(dataSource));

  // template engine 설정
  const hbs = exphbs.create({
    extname: 'hbs', // 파일 확장자
    defaultLayout: 'layout', // 기본 레이아웃 파일 (partials/layout.hbs)
    layoutsDir: join(__dirname, 'views/partials'), // 레이아웃 파일 경로
    partialsDir: join(__dirname, 'views/partials'), // 파셜 파일 경로
  });
  registerHandlebarsHelpers(hbs.handlebars as typeof Handlebars); // 헬퍼 등록
  app.useStaticAssets(join(__dirname, 'assets')); // 정적 파일 경로 설정
  app.setBaseViewsDir(join(__dirname, 'views'));
  app.engine('hbs', hbs.engine); // hbs 엔진을 사용
  app.setViewEngine('hbs');

  // 1시간마다 만료된 세션을 삭제하는 작업 실행
  setInterval(
    () => {
      void cleanupExpiredSessions(dataSource);
    },
    1000 * 60 * 60,
  );

  await app.listen(process.env.PORT ?? 3002);
}
bootstrap();
