import {
  IsOptional,
  IsBoolean,
  IsString,
  IsArray,
  IsEnum,
} from 'class-validator';
import { Transform } from 'class-transformer';
import { NoticeFaqType } from 'src/types/notice-faq.type';
import { PageDto } from './page.dto';

export class SearchListDto extends PageDto {
  @IsOptional()
  @Transform(({ obj }) => {
    const rawValue = obj.isActivate;
    if (rawValue === 'Y') return true;
    if (rawValue === 'N') return false;
    return undefined;
  })
  @IsBoolean()
  isActivate?: boolean;

  @IsOptional()
  @Transform(({ value }) => {
    if (value == null || value === '') return undefined;
    return value;
  })
  @IsString()
  searchKeyword?: string;

  @IsOptional()
  @Transform(({ value }) => {
    if (!value) return undefined;
    return Array.isArray(value) ? value : [value];
  })
  @IsArray()
  @IsString({ each: true })
  loginType?: string[];

  @IsOptional()
  @Transform(({ value }) => {
    if (!value) return undefined;
    return Array.isArray(value) ? value : [value];
  })
  @IsArray()
  @IsEnum(NoticeFaqType, { each: true })
  faqType?: NoticeFaqType[];
}
