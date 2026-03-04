import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { database } from './configures/database';
import { DataSource } from 'typeorm';
import { MembershipModule } from './membership/membership.module';
import { RecordModule } from './record/record.module';
import { AuthModule } from './auth/auth.module';
import { ConfigModule } from '@nestjs/config';
import { APP_GUARD } from '@nestjs/core';
import { JwtAuthGuard } from './auth/guards/jwt-auth.guard';
import { NoticeModule } from './notice/notice.module';
import { ChatModule } from './chat/chat.module';
import { SystemModule } from './system/system.module';

// 현재 환경에 따라 파일 경로 결정 함수
const getEnvFilePath = () => {
  if (process.env.NODE_ENV === 'production') {
    return '.env/production.env';
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
    MembershipModule,
    RecordModule,
    AuthModule,
    NoticeModule,
    ChatModule,
    SystemModule,
  ],
  controllers: [AppController],
  providers: [
    AppService,
    {
      provide: APP_GUARD,
      useClass: JwtAuthGuard,
    },
  ],
})
export class AppModule {
  constructor(private dataSource: DataSource) {}
}
