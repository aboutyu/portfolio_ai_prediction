import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';
import { UserDevice } from './user-devices.entity';
import { FoodLog } from './food-log.entity';
import { HealthLog } from './health-log.entity';

@Entity('user')
export class User {
  @ApiProperty({
    description: '고유 시퀀스 번호 (PK)',
    example: 1,
  })
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true })
  sequence: number;

  @ApiProperty({
    description: '사용자 아이디',
    example: 'user123',
  })
  @Column({ name: 'user_id', type: 'varchar', length: 255, unique: true })
  userId: string;

  @ApiProperty({
    description: '비밀번호 (암호화된 문자열)',
    example: '$2b$10$EpMq...',
  })
  @Column({ type: 'varchar', length: 255 })
  password: string;

  @ApiProperty({
    description: '사용자 이름 (닉네임)',
    example: '홍길동',
  })
  @Column({ type: 'varchar', length: 16 })
  username: string;

  @ApiProperty({
    description: '계정 생성일',
    example: '2023-10-25T12:00:00.000Z',
    default: 'CURRENT_TIMESTAMP',
  })
  @Column({
    name: 'create_date',
    type: 'datetime',
    default: () => 'CURRENT_TIMESTAMP',
  })
  createDate: Date;

  @ApiProperty({
    description: '마지막 로그인 일시',
    example: '2023-10-26T09:30:00.000Z',
    required: false,
    nullable: true,
  })
  @Column({ name: 'last_login', type: 'datetime', nullable: true })
  lastLogin: Date | null;

  @ApiProperty({
    description: '계정 활성화 여부 (true: 활성, false: 탈퇴)',
    example: true,
    default: true,
  })
  @Column({
    name: 'is_activate',
    type: 'char',
    length: 1,
    default: 'Y',
    comment: 'Y: 활성화 유저\nN: 비활성화(탈퇴) 유저',
    transformer: {
      to(value: boolean): string {
        return value ? 'Y' : 'N';
      },
      from(value: string): boolean {
        return value === 'Y';
      },
    },
  })
  isActivate: boolean;

  @ApiProperty({
    description: 'access 토큰 api 인증에서 사용',
    example:
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyU2VxdWVuY2UiOjEsInVzZXJJZCI6ImFAYS5jb20iLCJ1c2VybmFtZSI6Iu2FjOyKpO2KuOycoOyggCIsInJvbGUiOiJVU0VSX1JPTEUiLCJpYXQiOjE3NjU3OTA5NTYsImV4cCI6MTc2NTc5NDU1Nn0.fwvxveBoqZ6hYxEF6W6At65fF5sXmZWKffOBh98tT1c',
  })
  accessToken: string | null;

  @ApiProperty({
    description: '리프레시 토큰 (자동 로그인에 사용)',
    example:
      '2cc477b31e8697e3652bd48b819e460a:fe505889f72caa7466a6d45314b15310ef9ae09767f2fa8735ada6b64928935dfe6cc6a0ca5159d7380e5ab886f9de21653de7534ef5474d0911f78946ba6f38',
  })
  @Column({
    name: 'refresh_token',
    type: 'varchar',
    length: 255,
    nullable: true,
    default: null,
  })
  refreshToken: string | null;

  @ApiProperty({
    description: '등록된 디바이스 목록',
    example: [],
    default: [],
  })
  @OneToMany(() => UserDevice, (device) => device.user)
  devices: UserDevice[];

  @ApiProperty({
    description: '식사목록',
    example: [],
    default: [],
  })
  @OneToMany(() => FoodLog, (foodLog) => foodLog.user)
  foodLogs: FoodLog[];

  @ApiProperty({
    description: '식사목록',
    example: [],
    default: [],
  })
  @OneToMany(() => HealthLog, (healthLog) => healthLog.user)
  healthLogs: HealthLog[];
}
