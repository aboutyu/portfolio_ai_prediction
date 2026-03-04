import {
  Controller,
  Get,
  ParseEnumPipe,
  ParseIntPipe,
  Query,
  Req,
} from '@nestjs/common';
import express from 'express';
import { ApiOperation, ApiTags } from '@nestjs/swagger';
import { NoticeService } from './notice.service';
import { AccessTokenPayload } from 'src/auth/cert-token.service';
import { NoticeType } from 'src/helpers/enums/notice-type.enum';
import { NoticeFaqType } from 'src/helpers/enums/notice-faq-type.enum';

@ApiTags('공지사항 및 FAQ API')
@Controller('notice')
export class NoticeController {
  constructor(private readonly noticeService: NoticeService) {}

  // 공지사항 목록
  @Get('list')
  @ApiOperation({
    summary: '공지사항 목록 조회 API',
    description: '공지사항 목록을 조회합니다.',
  })
  async getNoticeList(
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10,
    @Req() request: express.Request,
  ) {
    const user = request.user as AccessTokenPayload;
    if (!user) {
      throw new Error('Unauthorized');
    }
    return await this.noticeService.getNoticeList(page, pageNum);
  }

  // FAQ 리스트(상세조회)
  @Get('faq/list')
  @ApiOperation({
    summary: 'FAQ 목록 조회 API',
    description: 'FAQ 목록을 조회합니다.',
  })
  async getFaqList(
    @Req() request: express.Request,
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10,
    @Query('faqType', new ParseEnumPipe(NoticeFaqType, { optional: true }))
    type?: NoticeFaqType,
  ) {
    const user = request.user as AccessTokenPayload;
    if (!user) {
      throw new Error('Unauthorized');
    }
    return await this.noticeService.getFaqList(page, pageNum, type);
  }

  // FAQ 목록
  @Get('faq/types')
  @ApiOperation({
    summary: 'FAQ 유형 목록 조회 API',
    description: 'FAQ 유형 목록을 조회합니다.',
  })
  async getFaqTypes(@Req() request: express.Request) {
    const user = request.user as AccessTokenPayload;
    if (!user) {
      throw new Error('Unauthorized');
    }
    return await this.noticeService.getFaqTypes();
  }
}
