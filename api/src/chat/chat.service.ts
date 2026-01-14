import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import {
  ChatMessageRole,
  ChatMessages,
} from 'src/entities/chat-message.entity';
import { successResponse } from 'src/helpers/enums/status.enum';
import { Repository } from 'typeorm';

@Injectable()
export class ChatService {
  constructor(
    @InjectRepository(ChatMessages)
    private chatRepository: Repository<ChatMessages>,
  ) {}

  // 채팅 메시지 목록
  async getMessages(userSequence: number, page: number, pageNum: number) {
    const skip = page * pageNum;
    const [messages, totalCount] = await this.chatRepository.findAndCount({
      where: { userSequence },
      order: { createTime: 'DESC' },
      skip: skip,
      take: pageNum,
    });
    const messageCount = messages.length;

    return successResponse(messages, page, totalCount, messageCount, pageNum);
  }

  // 채팅 메시지 저장
  async saveMessage(
    userSequence: number,
    message: string,
    messageRole: ChatMessageRole,
  ): Promise<ChatMessages> {
    const newMessage = this.chatRepository.create({
      message,
      messageRole,
      userSequence: Number(userSequence),
    });
    const savedMessage = await this.chatRepository.save(newMessage);
    return savedMessage;
  }
}
