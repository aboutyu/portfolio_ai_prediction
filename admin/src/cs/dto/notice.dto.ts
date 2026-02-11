import { Transform } from 'class-transformer';
import { IsEnum, IsOptional } from 'class-validator';
import { NoticeFaqType } from 'src/types/notice-faq.type';
import { NoticeType } from 'src/types/notice.type';

export class NoticeDto {
  @IsOptional()
  sequence?: number;

  title: string;
  content: string;
  isActivate: string;
  page: number;

  @IsEnum(NoticeType)
  type: NoticeType;

  @IsOptional()
  @IsEnum(NoticeFaqType)
  @Transform(({ value }) => {
    return value === '' ? null : value;
  })
  faqKind?: NoticeFaqType;

  @IsOptional()
  memo?: string;
}
