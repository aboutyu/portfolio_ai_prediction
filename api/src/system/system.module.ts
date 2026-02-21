import { Module } from '@nestjs/common';
import { SystemService } from './system.service';
import { SystemController } from './system.controller';
import { jwtModule } from 'src/configures/jwt-module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppVersion } from 'src/entities/app-version.entity';
import { Qna } from 'src/entities/qna.entity';
import { ServiceInfo } from 'src/entities/service-info.entity';
import { ServiceCode } from 'src/entities/service-code.entity';

@Module({
  imports: [
    jwtModule,
    TypeOrmModule.forFeature([AppVersion, ServiceInfo, Qna, ServiceCode]),
  ],
  providers: [SystemService],
  controllers: [SystemController],
})
export class SystemModule {}
