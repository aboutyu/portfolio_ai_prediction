import {
  WebSocketGateway,
  SubscribeMessage,
  MessageBody,
  ConnectedSocket,
  WebSocketServer,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';
import { ChatService } from '../../../chat/chat.service';
import { ChatMessageRole } from 'src/entities/chat-message.entity';
import { Ollama } from 'ollama';
import { GoogleGenerativeAI } from '@google/generative-ai';
import { LlmService } from '../llm/llm.service';

@WebSocketGateway({ cors: true }) // CORS 허용
export class ChatGateway {
  constructor(
    private readonly chatService: ChatService,
    private readonly llmService: LlmService,
  ) {}

  @WebSocketServer()
  server: Server;

  @SubscribeMessage('connect_chat_messages')
  async handleMessage(
    @MessageBody()
    data: { userId: number; message: string; messageRole: ChatMessageRole },
    @ConnectedSocket() client: Socket,
  ) {
    console.log('Received message from client:', data);
    // 1. 사용자 질문 DB 저장
    const savedMsg = await this.chatService.saveMessage(
      data.userId,
      data.message,
      ChatMessageRole.USER,
    );

    // 2. 클라이언트에 "잘 받았다"고 ACK
    client.emit('message_ack', savedMsg);

    // 3. LLM 호출 (비동기로 실행 - await를 하지 않거나, 별도 큐로 위임 추천)
    this.processLLMResponse(
      data.userId,
      data.message,
      data.messageRole,
      client.id,
    );
  }

  // LLM 처리 로직 (비동기)
  async processLLMResponse(
    userId: number,
    message: string,
    messageRole: ChatMessageRole,
    socketId: string,
  ) {
    try {
      let llmResponse: string = 'N/A';

      // 1. 역할(Role)에 따라 적절한 LLM 함수 호출
      if (messageRole === ChatMessageRole.LLAMA) {
        llmResponse = await this.fetchLlamaResponse(message);
      } else if (messageRole === ChatMessageRole.GEMINI) {
        llmResponse = await this.fetchGeminiResponse(message);
      }
      console.log('LLM Response:', llmResponse);

      // 4. LLM 응답 DB 저장
      const savedLLMMsg = await this.chatService.saveMessage(
        userId,
        llmResponse,
        messageRole,
      );
      console.log('Saved LLM Message:', savedLLMMsg);

      // 5. 실시간 전송 (해당 유저가 여전히 접속 중인지 확인 후 전송)
      // socketId로 특정하거나, userId로 룸을 만들어 전송
      this.server.to(socketId).emit('receive_message', savedLLMMsg);
    } catch (e) {
      console.error('LLM Error', e);
    }
  }

  async fetchLlamaResponse(message: string): Promise<string> {
    return await this.llmService.generate(ChatMessageRole.LLAMA, message);
  }

  async fetchGeminiResponse(message: string): Promise<string> {
    return await this.llmService.generate(ChatMessageRole.GEMINI, message);
  }
}
