import { Type } from 'class-transformer';
import { IsDate, IsOptional, IsString } from 'class-validator';
import { DeviceType } from 'src/types/device.type';

export class DeviceDto {
  @Type(() => String)
  @IsOptional()
  @IsString()
  deviceToken?: string;

  @Type(() => String)
  @IsOptional()
  @IsString()
  deviceName?: string;

  @Type(() => String)
  @IsOptional()
  @IsString()
  deviceModel?: string;

  @Type(() => String)
  @IsOptional()
  @IsString()
  deviceType?: DeviceType;

  @Type(() => Date)
  @IsOptional()
  @IsDate()
  createDate?: Date;
}
