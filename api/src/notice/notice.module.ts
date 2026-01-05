import { Module } from '@nestjs/common';
import { NoticeService } from './notice.service';
import { NoticeController } from './notice.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Notice } from 'src/entities/notice.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Notice])],
  providers: [NoticeService],
  controllers: [NoticeController],
})
export class NoticeModule {}
