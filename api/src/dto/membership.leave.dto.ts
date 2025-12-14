import { ApiProperty } from "@nestjs/swagger";

export class LeaveDto {
  @ApiProperty({
    description: '회원 고유 시퀀스',
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
    description: '비밀번호',
    default: 'a',
    required: true,
  })
  password: string;
}