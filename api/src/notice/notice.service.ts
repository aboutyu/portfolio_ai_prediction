import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Notice } from 'src/entities/notice.entity';
import { ApiResponse } from 'src/helpers/dto/api.response.dto';
import {
  NoticeFaqType,
  NoticeTypeLabel,
} from 'src/helpers/enums/notice-faq-type.enum';
import { NoticeType } from 'src/helpers/enums/notice-type.enum';
import { successResponse } from 'src/helpers/enums/status.enum';
import { Repository } from 'typeorm';

@Injectable()
export class NoticeService {
  constructor(
    @InjectRepository(Notice)
    private readonly noticeRepository: Repository<Notice>,
  ) {}

  private readonly noticeSelection = {
    sequence: true,
    type: true,
    faqKind: true,
    title: true,
    content: true,
    createDate: true,
    isActivate: true,
  } as const;

  async getNoticeList(
    page: number,
    pageNum: number,
  ): Promise<ApiResponse<Notice[]>> {
    const skip = page * pageNum;

    const [noticeList, totalCount] = await this.noticeRepository.findAndCount({
      where: { type: NoticeType.NOTICE, isActivate: true },
      select: this.noticeSelection,
      order: {
        sequence: 'DESC',
      },
      take: pageNum,
      skip: skip,
    });

    return successResponse(
      noticeList,
      page,
      totalCount,
      noticeList.length,
      pageNum,
    );
  }

  async getFaqList(
    page: number,
    pageNum: number,
    type?: NoticeFaqType,
  ): Promise<ApiResponse<Notice[]>> {
    const skip = page * pageNum;
    let whereCondition: any = { type: NoticeType.FAQ, isActivate: true };
    if (type) {
      whereCondition.faqKind = type;
    }

    const [noticeList, totalCount] = await this.noticeRepository.findAndCount({
      where: whereCondition,
      select: this.noticeSelection,
      order: {
        sequence: 'DESC',
      },
      take: pageNum,
      skip: skip,
    });

    return successResponse(
      noticeList,
      page,
      totalCount,
      noticeList.length,
      pageNum,
    );
  }

  async getFaqTypes() {
    const rawResult = await this.noticeRepository
      .createQueryBuilder('notice')
      .select('notice.faqKind', 'faqKind') // 1. 가져올 컬럼 선택 (Alias 지정)
      .distinct(true) // 2. 중복 제거 (DISTINCT)
      .where('notice.type = :type', { type: NoticeType.FAQ }) // 3. FAQ 타입인 것만
      .andWhere('notice.faqKind IS NOT NULL') // 4. NULL 제외
      .andWhere('notice.faqKind != ""') // 5. 빈 문자열 제외
      .orderBy('notice.faqKind', 'ASC') // 6. 가나다순 정렬
      .getRawMany(); // 7. Entity가 아닌 원시 데이터로 가져옴

    const sortOrder = Object.values(NoticeFaqType);

    const sortedFaqTypes = rawResult
      .map((item) => {
        const kind = item.faqKind as NoticeFaqType;
        return {
          faqKind: kind,
          faqName: NoticeTypeLabel[kind] || kind,
        };
      })
      // 정의해둔 순서(sortOrder)의 인덱스를 비교하여 정렬
      .sort((a, b) => {
        const indexA = sortOrder.indexOf(a.faqKind);
        const indexB = sortOrder.indexOf(b.faqKind);

        // Enum에 없는 값이 혹시 있다면 맨 뒤로 보냄
        if (indexA === -1) return 1;
        if (indexB === -1) return -1;

        return indexA - indexB; // 오름차순 정렬
      });

    return successResponse(sortedFaqTypes);
  }
}
