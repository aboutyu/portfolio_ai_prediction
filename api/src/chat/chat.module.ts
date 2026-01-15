import { Module } from '@nestjs/common';
import { ChatController } from './chat.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/entities/user.entity';
import { ChatMessages } from 'src/entities/chat-message.entity';
import { ChatService } from './chat.service';
import { CertTokenService } from 'src/auth/cert-token.service';
import { jwtModule } from 'src/configures/jwt-module';
import { ChatGateway } from '../helpers/modules/gateways/chat-gateway';
import { LlmModule } from 'src/helpers/modules/llm/llm.module';

@Module({
  imports: [
    jwtModule,
    TypeOrmModule.forFeature([User, ChatMessages]),
    LlmModule,
  ],
  controllers: [ChatController],
  providers: [ChatService, ChatGateway, CertTokenService],
})
export class ChatModule {}
