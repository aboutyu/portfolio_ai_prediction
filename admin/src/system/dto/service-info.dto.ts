import {
  IsString,
  IsOptional,
  IsEmail,
  IsUrl,
  IsNotEmpty,
  Length,
  IsNumber,
  ValidateIf,
} from 'class-validator';
import { Type } from 'class-transformer';

export class ServiceInfoDto {
  @IsString()
  @IsNotEmpty()
  @Length(2, 2, {
    message: '언어 코드는 반드시 2글자여야 합니다 (예: ko, en)',
  })
  language: string;

  @IsString()
  @IsNotEmpty()
  serviceName: string;

  @IsString()
  @IsNotEmpty()
  companyName: string;

  @IsString()
  @IsNotEmpty()
  ceoName: string;

  @IsString()
  @IsNotEmpty()
  privateManagerName: string;

  @IsString()
  @IsOptional()
  companyNumber?: string;

  @IsString()
  @IsOptional()
  telecomSellerNumber?: string;

  @IsString()
  @IsOptional()
  companyAddress?: string;

  @IsString()
  @IsOptional()
  companyZipcode?: string;

  @IsString()
  @IsOptional()
  phone?: string;

  @IsString()
  @IsOptional()
  memo?: string;

  @IsOptional()
  @Type(() => Number)
  @IsNumber()
  copyright?: number;

  @IsOptional()
  @ValidateIf((o) => o.companyUrl !== '') // 👈 빈 문자열일 경우 URL 검사 건너뜀
  @IsUrl()
  companyUrl?: string;

  @IsOptional()
  @ValidateIf((o) => o.serviceUrl !== '')
  @IsUrl()
  serviceUrl?: string;

  @IsOptional()
  @ValidateIf((o) => o.email !== '')
  @IsEmail()
  email?: string;
}
