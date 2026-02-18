import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { UserDevice } from './user-devices.entity';
import { FoodLog } from './food-log.entity';
import { HealthLog } from './health-log.entity';

@Entity('user')
export class User {
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true })
  sequence: number;

  @Column({ name: 'user_id', type: 'varchar', length: 255, unique: true })
  userId: string;

  @Column({ type: 'varchar', length: 255 })
  password: string;

  @Column({ type: 'varchar', length: 16 })
  username: string;

  @Column({ name: 'thumbnail', type: 'varchar', length: 255, nullable: true })
  thumbnail: string | null;

  @Column({
    name: 'create_date',
    type: 'datetime',
    default: () => 'CURRENT_TIMESTAMP',
  })
  createDate: Date;

  @Column({ name: 'last_login', type: 'datetime', nullable: true })
  lastLogin: Date | null;

  @Column({
    name: 'agree_required_terms',
    type: 'datetime',
  })
  agreeRequiredTerms: Date;

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

  @Column({
    name: 'refresh_token',
    type: 'varchar',
    length: 255,
    nullable: true,
    default: null,
  })
  refreshToken: string | null;

  @Column({
    name: 'memo',
    type: 'mediumtext',
    nullable: true,
    default: null,
  })
  memo: string | null;

  @OneToMany(() => UserDevice, (device) => device.user)
  devices: UserDevice[];

  @OneToMany(() => FoodLog, (foodLog) => foodLog.user)
  foodLogs: FoodLog[];

  @OneToMany(() => HealthLog, (healthLog) => healthLog.user)
  healthLogs: HealthLog[];
}
