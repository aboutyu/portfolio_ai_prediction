import { Body, Controller, Get, Post, Query, Render } from '@nestjs/common';
import { CsService } from './cs.service';
import { PageDto } from 'src/dto/page.dto';
import { NoticeType } from 'src/types/notice.type';
import { NoticeDto } from './dto/notice.dto';

@Controller('cs')
export class CsController {
  constructor(private readonly csService: CsService) {}

  @Get('/notice')
  @Render('cs/notice_list.hbs')
  async getNoticeList(@Query() pageDto: PageDto) {
    return await this.csService.getNoticeList(pageDto, NoticeType.NOTICE);
  }

  @Get('/notice/detail')
  @Render('cs/notice_detail.hbs')
  async getNoticeDetail(@Query() pageDto: PageDto) {
    return await this.csService.getNoticeDetail(pageDto, NoticeType.NOTICE);
  }

  @Post('/notice/update')
  async updateNotice(@Body() dto: NoticeDto) {
    console.log('dto', dto);
    return await this.csService.updateNotice(dto);
  }

  @Get('/faq')
  @Render('cs/notice_list.hbs')
  async getFaqList(@Query() pageDto: PageDto) {
    return await this.csService.getNoticeList(pageDto, NoticeType.FAQ);
  }

  @Get('/faq/detail')
  @Render('cs/notice_detail.hbs')
  async getFaqDetail(@Query() pageDto: PageDto) {
    return await this.csService.getNoticeDetail(pageDto, NoticeType.FAQ);
  }

  @Get('/qna')
  @Render('cs/qna_list.hbs')
  async getQnaList(@Query() pageDto: PageDto) {
    return await this.csService.getQnaList(pageDto);
  }
}
