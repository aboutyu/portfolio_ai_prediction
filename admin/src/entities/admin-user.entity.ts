import {
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  Index,
} from 'typeorm';

@Entity('admin')
export class AdminUser {
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true })
  sequence: number;

  @Index()
  @Column({ type: 'varchar', length: 255, name: 'user_id' })
  userId: string;

  @Column({ type: 'varchar', length: 32, nullable: true })
  password?: string | null;

  @Column({ type: 'varchar', length: 45, name: 'user_name' })
  userName: string;

  @Column({
    name: 'is_activate',
    type: 'char',
    length: 1,
    default: 'Y',
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

  @CreateDateColumn({
    type: 'timestamp',
    name: 'create_time',
    nullable: true,
    default: () => 'CURRENT_TIMESTAMP',
  })
  createTime: Date;
}
