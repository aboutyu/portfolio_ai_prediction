import { Controller, Get, ParseIntPipe, Query, Req } from '@nestjs/common';
import express from 'express';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { ChatService } from './chat.service';
import { AccessTokenPayload } from 'src/auth/cert-token.service';

@ApiTags('채팅 관련 API')
@Controller('chat')
export class ChatController {
  constructor(private readonly chatService: ChatService) {}

  // 메시지 목록 조회
  @Get('messages')
  @ApiOperation({
    summary: '채팅 메시지 전송 API',
    description: '사용자가 채팅 메시지를 전송합니다.',
  })
  async getMessage(
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10,
    @Req() request: express.Request,
  ) {
    const user = request.user as AccessTokenPayload;
    if (!user) {
      throw new Error('Unauthorized');
    }

    return await this.chatService.getMessages(user.userSequence, page, pageNum);
  }
}
