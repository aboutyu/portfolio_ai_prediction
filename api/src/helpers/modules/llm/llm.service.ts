import { Injectable, Logger } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Ollama } from 'ollama';
import { GoogleGenerativeAI } from '@google/generative-ai';
import { ChatMessageRole } from 'src/entities/chat-message.entity'; // 경로 확인 필요

@Injectable()
export class LlmService {
  private readonly logger = new Logger(LlmService.name);
  private readonly ollamaClient: Ollama;
  private readonly geminiClient: GoogleGenerativeAI;

  constructor(private readonly configService: ConfigService) {
    // 1. Ollama 초기화
    this.ollamaClient = new Ollama({
      host: process.env.AI_API_URL || 'http://localhost:11434',
    });

    // 2. Gemini 초기화
    this.geminiClient = new GoogleGenerativeAI(
      process.env.GEMINI_API_KEY || '',
    );
  }

  // ✅ 통합된 생성 메서드
  async generate(role: ChatMessageRole, prompt: string): Promise<string> {
    try {
      switch (role) {
        case ChatMessageRole.LLAMA:
          return await this.generateLlama(prompt);
        case ChatMessageRole.GEMINI:
          return await this.generateGemini(prompt);
        default:
          this.logger.error(`Failed to generate text using ${role}`);
          return `Unsupported LLM role: ${role}`;
      }
    } catch (error) {
      this.logger.error(`Failed to generate text using ${role}`, error);
      return '죄송합니다. 답변을 생성하는 도중 오류가 발생했습니다.';
    }
  }

  private async generateLlama(prompt: string): Promise<string> {
    try {
      const response = await this.ollamaClient.chat({
        model: process.env.AI_MODEL || 'llama3.2:1b',
        // format: 'json',
        stream: false,
        messages: [
          { role: 'user', content: this.buildPromptWithLanguage(prompt, 'ko') },
        ],
      });
      return response.message.content;
    } catch (error) {
      this.logger.error('AI Processing Error:', error);
      return error.message || 'AI 처리 중 오류가 발생했습니다.';
    }
  }

  private async generateGemini(prompt: string): Promise<string> {
    const model = {
      model: 'gemini-2.5-flash',
      generationConfig: {
        // responseMimeType: 'application/json',
        temperature: 0.3, // 창의성 낮춤(정확도 UP)
      },
    };
    const genAi = this.geminiClient.getGenerativeModel(model);
    const result = await genAi.generateContent(
      this.buildPromptWithLanguage(prompt, 'ko'),
    );
    const response = result.response;
    return response.text();
  }

  // 🛠️ 언어 지시사항을 프롬프트 뒤에 붙여주는 헬퍼 함수
  private buildPromptWithLanguage(prompt: string, language: string): string {
    let instruction = '';

    if (language === 'ko') {
      instruction = '\n\n(반드시 한국어로 답변해 주세요.)';
    } else if (language === 'en') {
      instruction = '\n\n(Please answer in English.)';
    } else if (language === 'auto') {
      // auto일 때도 확실하게 하기 위해 시스템 프롬프트처럼 추가
      instruction =
        '\n\n(Please answer in the same language as the user asked.)';
    }

    return prompt + instruction;
  }
}
