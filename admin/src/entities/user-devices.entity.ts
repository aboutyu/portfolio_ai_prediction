import {
  Entity,
  Column,
  CreateDateColumn,
  ManyToOne,
  JoinColumn,
  PrimaryColumn,
} from 'typeorm';
import { User } from './user.entity';
import { DeviceType } from 'src/types/device.type';

@Entity('user_devices')
export class UserDevice {
  @PrimaryColumn({ name: 'user_sequence', type: 'int', unsigned: true })
  userSequence: number;

  @PrimaryColumn({ name: 'device_token', type: 'varchar', length: 255 })
  deviceToken: string;

  @PrimaryColumn({
    name: 'device_type',
    type: 'char',
    length: 3,
    default: DeviceType.IOS,
    comment: '디바이스 타입\n- IOS : 아이폰\n- AOS : 안드로이드',
  })
  deviceType: DeviceType;

  @Column({ name: 'device_name', type: 'varchar', length: 255, nullable: true })
  deviceName: string | null;

  @Column({
    name: 'device_model',
    type: 'varchar',
    length: 255,
    nullable: true,
  })
  deviceModel: string | null;

  @CreateDateColumn({ name: 'create_date', type: 'timestamp' })
  createDate: Date;

  @ManyToOne(() => User, (user) => user.devices, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  @JoinColumn({ name: 'user_sequence', referencedColumnName: 'sequence' })
  user: User;
}
