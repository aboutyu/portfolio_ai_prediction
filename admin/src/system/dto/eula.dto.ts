import { Type } from 'class-transformer';
import { IsEnum, IsOptional, IsString } from 'class-validator';
import { TermsType } from 'src/types/terms.type';

export class EulaDto {
  @IsEnum(TermsType)
  type: TermsType;

  @Type(() => String)
  @IsString()
  @IsOptional()
  lang: string = 'ko';
}
