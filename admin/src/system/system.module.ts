import { Module } from '@nestjs/common';
import { SystemService } from './system.service';
import { SystemController } from './system.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ServiceInfo } from 'src/entities/service-info.entity';

@Module({
  imports: [TypeOrmModule.forFeature([ServiceInfo])],
  providers: [SystemService],
  controllers: [SystemController],
})
export class SystemModule {}
