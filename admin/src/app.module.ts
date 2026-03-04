import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { database } from './helpers/config/database';
import { LoginModule } from './login/login.module';
import { DashboardModule } from './dashboard/dashboard.module';
import { ConfigModule } from '@nestjs/config';
import { UsersModule } from './users/users.module';
import { SessionAuthGuard } from './helpers/guards/auth.guard';
import { APP_GUARD, APP_INTERCEPTOR } from '@nestjs/core';
import { CsModule } from './cs/cs.module';
import { SystemModule } from './system/system.module';
import { ServiceInfo } from './entities/service-info.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TemplateVarsInterceptor } from './helpers/intercepts/template-engine-variables.intercept';
import { DisplayModule } from './display/display.module';

// 현재 환경에 따라 파일 경로 결정 함수
const getEnvFilePath = () => {
  if (process.env.NODE_ENV === 'production') {
    return '.env/production.env';
  } else if (process.env.NODE_ENV === 'local') {
    return '.env/local.env';
  }
  return '.env/development.env';
};

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: getEnvFilePath(),
    }),
    TypeOrmModule.forFeature([ServiceInfo]),
    database,
    LoginModule,
    DashboardModule,
    UsersModule,
    CsModule,
    SystemModule,
    DisplayModule,
  ],
  controllers: [AppController],
  providers: [
    {
      provide: APP_GUARD,
      useClass: SessionAuthGuard,
    },
    {
      provide: APP_INTERCEPTOR,
      useClass: TemplateVarsInterceptor,
    },
    AppService,
  ],
})
export class AppModule {}
