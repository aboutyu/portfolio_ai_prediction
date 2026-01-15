import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { LlmService } from './llm.service';

@Module({
  imports: [ConfigModule], // ConfigService 사용을 위해 import
  providers: [LlmService],
  exports: [LlmService], // ✅ 다른 모듈에서 LlmService를 쓸 수 있게 내보내기
})
export class LlmModule {}
