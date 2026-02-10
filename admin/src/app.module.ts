import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { database } from './helpers/config/database';
import { LoginModule } from './login/login.module';
import { DashboardModule } from './dashboard/dashboard.module';
import { ConfigModule } from '@nestjs/config';
import { UsersModule } from './users/users.module';

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
    database,
    LoginModule,
    DashboardModule,
    UsersModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule { }
