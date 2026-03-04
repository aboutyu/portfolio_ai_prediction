import { ApiProperty } from '@nestjs/swagger';
import { IsEnum, IsOptional } from 'class-validator';
import { PlatformType } from 'src/helpers/enums/platform-type.enum';

export class RequestTokenDto {
  @ApiProperty({
    description: '유저 시퀀스',
    default: 1,
    required: true,
  })
  sequence: number;

  @ApiProperty({
    description: '유저 ID',
    default: 'a@a.com',
    required: true,
  })
  userId: string;

  @ApiProperty({
    description: 'refresh token',
    default: 'a',
    required: true,
  })
  refreshToken: string;

  @ApiProperty({
    description: '디바이스 토큰(FCM)',
    default: 'device_token_string_firebase_cloud_messaging',
    required: false,
    nullable: true,
  })
  deviceToken?: string | null;

  @ApiProperty({
    description: '디바이스 타입 (IOS / AOS)',
    enum: PlatformType,
    default: PlatformType.IOS,
    required: false,
    nullable: true,
  })
  @IsEnum(PlatformType)
  @IsOptional()
  deviceType?: PlatformType | null;

  @ApiProperty({
    description: '디바이스 이름',
    default: 'iPhone 12 mini',
    required: false,
    nullable: true,
  })
  deviceName?: string | null;

  @ApiProperty({
    description: '디바이스 모델명',
    default: 'MJNQ3KH/A',
    required: false,
    nullable: true,
  })
  deviceModel?: string | null;
}
