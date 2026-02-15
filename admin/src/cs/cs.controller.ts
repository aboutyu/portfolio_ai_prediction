import { Body, Controller, Get, Post, Query, Render } from '@nestjs/common';
import { CsService } from './cs.service';
import { NoticeType } from 'src/types/notice.type';
import { NoticeDto } from './dto/notice.dto';
import { SearchListDto } from 'src/dto/search-list.dto';

@Controller('cs')
export class CsController {
  constructor(private readonly csService: CsService) {}

  @Get('/notice')
  @Render('cs/notice_list.hbs')
  async getNoticeList(@Query() searchDto: SearchListDto) {
    return await this.csService.getNoticeList(searchDto, NoticeType.NOTICE);
  }

  @Get('/notice/detail')
  @Render('cs/notice_detail.hbs')
  async getNoticeDetail(@Query() searchDto: SearchListDto) {
    return await this.csService.getNoticeDetail(searchDto, NoticeType.NOTICE);
  }

  @Post('/notice/update')
  async updateNotice(@Body() dto: NoticeDto) {
    return await this.csService.updateNotice(dto);
  }

  @Get('/faq')
  @Render('cs/notice_list.hbs')
  async getFaqList(@Query() searchDto: SearchListDto) {
    return await this.csService.getNoticeList(searchDto, NoticeType.FAQ);
  }

  @Get('/faq/detail')
  @Render('cs/notice_detail.hbs')
  async getFaqDetail(@Query() searchDto: SearchListDto) {
    return await this.csService.getNoticeDetail(searchDto, NoticeType.FAQ);
  }

  @Get('/qna')
  @Render('cs/qna_list.hbs')
  async getQnaList(@Query() searchDto: SearchListDto) {
    return await this.csService.getQnaList(searchDto);
  }
}
