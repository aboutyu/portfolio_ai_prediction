import { Transform } from 'class-transformer';
import { IsEnum, IsOptional } from 'class-validator';
import { SearchListDto } from 'src/dto/search-list.dto';
import { NoticeFaqType } from 'src/types/notice-faq.type';
import { NoticeType } from 'src/types/notice.type';

export class NoticeDto extends SearchListDto {
  title: string;
  content: string;

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
