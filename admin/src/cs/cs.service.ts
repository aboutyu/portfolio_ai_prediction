import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Notice } from 'src/entities/notice.entity';
import { pageSize } from 'src/helpers/constants';
import {
  faqKinds,
  NoticeFaqLabel,
  NoticeFaqType,
} from 'src/types/notice-faq.type';
import { NoticeType } from 'src/types/notice.type';
import { Brackets, Repository } from 'typeorm';
import { NoticeDto } from './dto/notice.dto';
import { SearchListDto } from 'src/dto/search-list.dto';

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

  async getNoticeList(searchDto: SearchListDto, type: NoticeType) {
    const { sequence, isActivate, searchKeyword } = searchDto;
    const selectFields = Object.keys(this.listSelection).map(
      (field) => `notice.${field}`,
    );

    const queryBuilder = this.noticeRepository
      .createQueryBuilder('notice')
      .select(selectFields)
      .where('notice.type = :type', { type });

    // 활성화 여부 검색
    if (isActivate !== undefined && isActivate !== null) {
      queryBuilder.andWhere('notice.isActivate = :isActivate', {
        isActivate: isActivate ? 'Y' : 'N',
      });
    }

    // 제목 및 내용 자연어 검색
    if (searchKeyword) {
      const keywords = searchKeyword.trim().split(/\s+/);

      keywords.forEach((word, index) => {
        const paramName = `word${index}`;
        queryBuilder.andWhere(
          new Brackets((qb) => {
            qb.where(`notice.title LIKE :${paramName}`, {
              [paramName]: `%${word}%`,
            }).orWhere(`notice.content LIKE :${paramName}`, {
              [paramName]: `%${word}%`,
            });
          }),
        );
      });
    }

    // FAQ 종류 검색
    if (
      type === NoticeType.FAQ &&
      searchDto.faqType &&
      searchDto.faqType.length > 0
    ) {
      queryBuilder.andWhere('notice.faqKind IN (:...faqTypes)', {
        faqTypes: searchDto.faqType.map((kind) => kind.trim()),
      });
    }

    // 정렬 및 페이징
    const [list, total] = await queryBuilder
      .orderBy('notice.sequence', 'DESC')
      .skip(searchDto.skip)
      .take(pageSize)
      .getManyAndCount();

    // map을 돌려 각 항목에 label 속성을 추가합니다.
    const items = list.map((contents) => ({
      ...contents,
      typeLabel: contents.faqKind
        ? NoticeFaqLabel[contents.faqKind as NoticeFaqType]
        : '-',
    }));

    return {
      items,
      isFaq: type === NoticeType.FAQ,
      total,
      page: searchDto.page,
      pageSize,
      searchDto,
    };
  }

  async getNoticeDetail(searchDto: SearchListDto, type: NoticeType) {
    const item = await this.noticeRepository.findOne({
      where: { sequence: searchDto.sequence },
    });
    return {
      item,
      page: searchDto.page,
      isFaq: type === NoticeType.FAQ,
      faqKinds,
      searchDto,
    };
  }

  async addNotice(dto: NoticeDto) {
    // const newNotice = this.noticeRepository.create({
    //   ...dto,
    //   isActivate: dto.isActivate === 'true' || dto.isActivate === true,
    // });
    // return await this.noticeRepository.save(newNotice);
  }

  async updateNotice(dto: NoticeDto) {
    const updateNotice = await this.noticeRepository.update(
      { sequence: dto.sequence },
      {
        title: dto.title,
        content: dto.content,
        memo: dto.memo,
        isActivate: dto.isActivate,
        faqKind: dto.type === NoticeType.FAQ ? dto.faqKind : null,
      },
    );
    return { updateNotice, page: dto.page, isFaq: dto.type === NoticeType.FAQ };
  }

  async getQnaList(searchDto: SearchListDto) {
    return [];
  }
}
