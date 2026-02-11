import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PageDto } from 'src/dto/page.dto';
import { Notice } from 'src/entities/notice.entity';
import { pageSize } from 'src/helpers/constants';
import {
  faqKinds,
  NoticeFaqLabel,
  NoticeFaqType,
} from 'src/types/notice-faq.type';
import { NoticeType } from 'src/types/notice.type';
import { Repository } from 'typeorm';
import { NoticeDto } from './dto/notice.dto';
import { title } from 'process';

@Injectable()
export class CsService {
  constructor(
    @InjectRepository(Notice)
    private readonly noticeRepository: Repository<Notice>,
  ) {}

  private readonly listSelection = {
    sequence: true,
    faqKind: true,
    title: true,
    createDate: true,
    isActivate: true,
  } as const;

  async getNoticeList(dto: PageDto, type: NoticeType) {
    const [list, total] = await this.noticeRepository.findAndCount({
      where: { type },
      select: this.listSelection,
      order: {
        sequence: 'DESC',
      },
      take: pageSize,
      skip: dto.skip,
    });

    // map을 돌려 각 항목에 label 속성을 추가합니다.
    const items = list.map((contents) => ({
      ...contents,
      typeLabel: contents.faqKind
        ? NoticeFaqLabel[contents.faqKind as NoticeFaqType]
        : '-',
    }));

    console.log('items', items);

    return {
      items,
      isFaq: type === NoticeType.FAQ,
      total,
      page: dto.page,
      pageSize,
    };
  }

  async getNoticeDetail(dto: PageDto, type: NoticeType) {
    const item = await this.noticeRepository.findOne({
      where: { sequence: dto.sequence },
    });
    return { item, page: dto.page, isFaq: type === NoticeType.FAQ, faqKinds };
  }

  async addNotice(dto: NoticeDto) {
    // const newNotice = this.noticeRepository.create({
    //   ...dto,
    //   isActivate: dto.isActivate === 'true' || dto.isActivate === true,
    // });
    // return await this.noticeRepository.save(newNotice);
  }

  async updateNotice(dto: NoticeDto) {
    console.log('dto in service', dto);
    const updateNotice = await this.noticeRepository.update(
      { sequence: dto.sequence },
      {
        title: dto.title,
        content: dto.content,
        memo: dto.memo,
        isActivate: dto.isActivate === 'Y',
        faqKind: dto.type === NoticeType.FAQ ? dto.faqKind : null,
      },
    );
    return { updateNotice, page: dto.page, isFaq: dto.type === NoticeType.FAQ };
  }

  async getQnaList(dto: PageDto) {
    return [];
  }
}
