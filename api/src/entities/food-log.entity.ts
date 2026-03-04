import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
  Index,
} from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';
import { User } from './user.entity'; // User 엔티티 경로 확인
import { TimelineGroup } from './timeline-group.entity';
import { IsISO8601 } from 'class-validator';

@Entity('food_logs')
export class FoodLog {
  // 1. sequence (PK, AI, Unsigned)
  @ApiProperty({ description: '고유 번호 (PK)', example: 1 })
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true })
  sequence: number;

  // 2. user_sequence (FK)
  @ApiProperty({ description: '유저 시퀀스 (FK)', example: 1 })
  @Column({ name: 'user_sequence', type: 'int', unsigned: true })
  userSequence: number;

  // 4. food_name
  @ApiProperty({ description: '음식 이름', example: '현미밥' })
  @Column({ name: 'food_name', type: 'varchar', length: 255 })
  foodName: string;

  // 5. calories (DECIMAL 10, 3)
  @ApiProperty({ description: '칼로리 (kcal)', example: 300.5 })
  @Column({
    type: 'decimal',
    precision: 10,
    scale: 3, // 📸 스크린샷에 맞춰 소수점 3자리로 설정
    default: 0,
    transformer: {
      // DB에서 문자열로 넘어오는 Decimal을 숫자로 변환
      to: (value) => value,
      from: (value) => parseFloat(value),
    },
  })
  calories: number;

  // 6. record_date
  @ApiProperty({
    description: '식사 시간 (정렬 기준)',
    example: '2025-12-10T12:00:00.000Z',
  })
  @Column({ name: 'record_date', type: 'datetime' })
  @IsISO8601()
  recordDate: Date;

  // 7. create_date
  @ApiProperty({ description: '데이터 생성일' })
  @CreateDateColumn({ name: 'create_date', type: 'timestamp' })
  createDate: Date;

  // 8. 메모
  @ApiProperty({ description: '메모', example: '점심 식사' })
  @Column({ name: 'memo', type: 'tinytext', nullable: true })
  memo?: string;

  // ✅ User 테이블과의 관계 설정 (N:1)
  @ManyToOne(() => User, (user) => user.foodLogs, {
    onDelete: 'CASCADE', // 유저 삭제 시 식단 기록도 삭제
    onUpdate: 'CASCADE',
  })
  @JoinColumn({ name: 'user_sequence', referencedColumnName: 'sequence' })
  user: User;

  // group_uuid를 FK로 설정
  @ManyToOne(() => TimelineGroup, (group) => group.foodLogs)
  @JoinColumn({ name: 'group_uuid', referencedColumnName: 'uuid' })
  group: TimelineGroup;

  // group_uuid (Batch ID) - 조회 성능을 위해 Index 추가 추천
  @ApiProperty({
    description: '그룹핑용 UUID (Batch ID)',
    example: '550e8400-e29b-...',
  })
  @Index('idx_food_group_uuid') // ✅ UUID로 묶어서 조회할 때 속도 향상
  @Column({ name: 'group_uuid', type: 'varchar', length: 36 })
  groupUuid: string;
}
