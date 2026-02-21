import {
  IsEnum,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsString,
  IsBoolean,
} from 'class-validator';
import { Transform } from 'class-transformer';
import { DeviceType } from 'src/types/device.type'; // 실제 경로에 맞춰 수정하세요

export class AppVersionDto {
  @IsNotEmpty()
  @IsEnum(DeviceType)
  type: DeviceType;

  @IsNotEmpty()
  @IsString()
  version: string;

  @IsNotEmpty()
  @IsNumber()
  buildNumber: number;

  @IsNotEmpty()
  @Transform(({ value }) => {
    if (value === 'Y' || value === true || value === 'true') return true;
    if (value === 'N' || value === false || value === 'false') return false;
    return value;
  })
  @IsBoolean()
  isEssential: boolean;

  @IsOptional()
  @IsString()
  memo?: string;
}
