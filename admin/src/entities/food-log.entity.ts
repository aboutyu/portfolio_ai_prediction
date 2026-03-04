import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
  Index,
} from 'typeorm';
import { User } from './user.entity';
import { IsISO8601 } from 'class-validator';
import { TimelineGroup } from './timeline-group.entity';

@Entity('food_logs')
export class FoodLog {
  // 1. sequence (PK, AI, Unsigned)
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true })
  sequence: number;

  // 2. user_sequence (FK)
  @Column({ name: 'user_sequence', type: 'int', unsigned: true })
  userSequence: number;

  // 4. food_name
  @Column({ name: 'food_name', type: 'varchar', length: 255 })
  foodName: string;

  // 5. calories (DECIMAL 10, 3)
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
  @Column({ name: 'record_date', type: 'datetime' })
  @IsISO8601()
  recordDate: Date;

  // 7. create_date
  @CreateDateColumn({ name: 'create_date', type: 'timestamp' })
  createDate: Date;

  // 8. 메모
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

  @Index('idx_food_group_uuid') // ✅ UUID로 묶어서 조회할 때 속도 향상
  @Column({ name: 'group_uuid', type: 'varchar', length: 36 })
  groupUuid: string;
}
