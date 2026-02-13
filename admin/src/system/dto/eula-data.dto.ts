import { Type } from 'class-transformer';
import { IsEnum, IsNumber, IsOptional, IsString } from 'class-validator';
import { TermsType } from 'src/types/terms.type';

export class EulaDataDto {
  @IsEnum(TermsType)
  type: TermsType;

  @Type(() => String)
  @IsString()
  @IsOptional()
  language: string = 'ko';

  @Type(() => Number)
  @IsOptional()
  @IsNumber()
  sequence?: number;

  @Type(() => String)
  @IsString()
  title: string;

  @Type(() => String)
  @IsString()
  displayName: string;

  @Type(() => String)
  @IsString()
  content: string;

  @Type(() => Boolean)
  @IsOptional()
  isRequired: boolean = true;

  @Type(() => Boolean)
  @IsOptional()
  isActivate: boolean = true;

  @Type(() => Date)
  @IsOptional()
  startDate?: Date;

  @Type(() => String)
  @IsOptional()
  memo?: string;
}
