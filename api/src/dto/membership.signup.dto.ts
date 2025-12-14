import { ApiProperty } from "@nestjs/swagger";

export class SignupDto {
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

  @ApiProperty({
    description: '유저이름',
    default: '김유저',
    required: true,
  })
  username: string;
}
