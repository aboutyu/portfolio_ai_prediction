import {
  Entity,
  PrimaryColumn,
  Column,
  CreateDateColumn,
  OneToMany,
} from 'typeorm';
import { FoodLog } from './food-log.entity';
import { HealthLog } from './health-log.entity';
import { IsISO8601 } from 'class-validator';

@Entity('timeline_groups')
export class TimelineGroup {
  // UUID를 PK로 사용 (VARCHAR 36)
  @PrimaryColumn({ type: 'varchar', length: 36 })
  uuid: string;

  @Column({ name: 'user_sequence', type: 'int' })
  userSequence: number;

  @Column({
    name: 'record_time',
    type: 'datetime',
    default: () => 'CURRENT_TIMESTAMP',
  })
  @IsISO8601()
  recordTime: Date;

  @Column({ type: 'tinytext', nullable: true })
  memo: string;

  @CreateDateColumn({ name: 'create_date', type: 'datetime' })
  createDate: Date;

  // ✅ 자식 테이블과의 관계 설정 (DB 컬럼 아님)
  @OneToMany(() => FoodLog, (food) => food.group, { cascade: true })
  foodLogs: FoodLog[];

  @OneToMany(() => HealthLog, (health) => health.group, { cascade: true })
  healthLogs: HealthLog[];
}
