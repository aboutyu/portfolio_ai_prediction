import { Module } from '@nestjs/common';
import { DisplayService } from './display.service';
import { DisplayController } from './display.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppVersion } from 'src/entities/app-version.entity';

@Module({
  imports: [TypeOrmModule.forFeature([AppVersion])],
  providers: [DisplayService],
  controllers: [DisplayController],
})
export class DisplayModule {}
