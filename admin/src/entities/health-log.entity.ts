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

// ✅ 스크린샷의 코멘트를 참고하여 Enum 정의 (타입 안전성 확보)
export enum HealthType {
  STEP_COUNT = 'SCT', // 걸음수
  BLOOD_PRESSURE = 'BPT', // 혈압
  BLOOD_GLUCOSE = 'BGT', // 혈당
}

@Entity('health_logs')
export class HealthLog {
  // 1. sequence (PK, AI, Unsigned)
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true })
  sequence: number;

  // 2. user_sequence (FK)
  @Column({ name: 'user_sequence', type: 'int', unsigned: true })
  userSequence: number;

  // 3. group_uuid (Batch ID)
  // UUID로 묶어서 조회하는 경우가 많으므로 인덱스 추가
  @Index('idx_health_group_uuid')
  @Column({ name: 'group_uuid', type: 'varchar', length: 36 })
  groupUuid: string;

  // 4. health_type (CHAR 3)
  @Column({
    name: 'health_type',
    type: 'char',
    length: 3,
    default: HealthType.STEP_COUNT,
    comment:
      'SCT: Step Count Type(걸음수)\nBPT: Blood Pressure Type(혈압)\nBGT: Blood Glucose Type(혈당)',
  })
  healthType: HealthType;

  // 5. health_value (DECIMAL 10, 3)
  // 기존 step_count, heart_rate 등이 통합된 컬럼입니다.
  @Column({
    name: 'health_value',
    type: 'decimal',
    precision: 10,
    scale: 3,
    default: 0,
    transformer: {
      to: (value) => value,
      from: (value) => parseFloat(value),
    },
  })
  healthValue: number;

  @Column({
    name: 'health_extra_value',
    type: 'decimal',
    precision: 10,
    scale: 3,
    default: 0,
    transformer: {
      to: (value) => value,
      from: (value) => parseFloat(value),
    },
  })
  healthExtraValue: number;

  // 6. device_type
  @Column({ name: 'device_type', type: 'char', length: 3 })
  deviceType: string;

  // 7. record_date
  @Column({ name: 'record_date', type: 'datetime' })
  @IsISO8601()
  recordDate: Date;

  // 8. create_date
  @CreateDateColumn({ name: 'create_date', type: 'timestamp' })
  createDate: Date;

  // 9. 메모
  @Column({ name: 'memo', type: 'tinytext', nullable: true })
  memo?: string;

  // ✅ User 테이블과의 관계 설정
  @ManyToOne(() => User, (user) => user.healthLogs, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  @JoinColumn({ name: 'user_sequence', referencedColumnName: 'sequence' })
  user: User;

  // group_uuid를 FK로 설정
  @ManyToOne(() => TimelineGroup, (group) => group.healthLogs)
  @JoinColumn({ name: 'group_uuid', referencedColumnName: 'uuid' })
  group: TimelineGroup;
}
