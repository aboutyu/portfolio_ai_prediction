import { ApiProperty } from "@nestjs/swagger";
import { Column } from "typeorm/browser/decorator/columns/Column.js";

export class LogoutDto {
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
    description: '디바이스 토큰(FCM)',
    default: 'device_token_string_firebase_cloud_messaging',
    required: false,
    nullable: true,
  })
  deviceToken?: string | null;

  @ApiProperty({ 
    description: '디바이스 타입 (IOS / AOS)', 
    default: 'IOS',
    required: false,
    nullable: true,
  })
  deviceType?: string | null;
}
