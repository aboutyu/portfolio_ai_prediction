import { Module } from '@nestjs/common';
import { CsService } from './cs.service';
import { CsController } from './cs.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Notice } from 'src/entities/notice.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Notice])],
  providers: [CsService],
  controllers: [CsController],
})
export class CsModule {}
