import { Entity, PrimaryGeneratedColumn, Column, CreateDateColumn, ManyToOne, JoinColumn, PrimaryColumn } from 'typeorm';
import { ApiProperty } from '@nestjs/swagger';
import { User } from './user.entity'; // User 엔티티 경로에 맞춰 수정해주세요
import { DeviceType } from 'src/helpers/enums/device-type.enum';

@Entity('user_devices')
export class UserDevice {
  @ApiProperty({ description: '유저 시퀀스 (FK)', example: 1 })
  @PrimaryColumn({ name: 'user_sequence', type: 'int', unsigned: true })
  userSequence: number;

  @ApiProperty({ description: '디바이스 토큰(FCM)', example: 'fcm_token_string...' })
  @PrimaryColumn({ name: 'device_token', type: 'varchar', length: 255 })
  deviceToken: string;

  @ApiProperty({ 
    description: '디바이스 타입 (IOS / AOS)', 
    example: DeviceType.IOS,
    enum: DeviceType
  })
  @PrimaryColumn({
    name: 'device_type',
    type: 'char',
    length: 3,
    default: DeviceType.IOS,
    comment: '디바이스 타입\n- IOS : 아이폰\n- AOS : 안드로이드',
  })
  deviceType: DeviceType;

  @ApiProperty({ description: '디바이스 이름 (예: 홍길동의 iPhone)', required: false, nullable: true })
  @Column({ name: 'device_name', type: 'varchar', length: 255, nullable: true })
  deviceName: string | null;

  @ApiProperty({ description: '디바이스 모델명 (예: iPhone 14 Pro)', required: false, nullable: true })
  @Column({ name: 'device_model', type: 'varchar', length: 255, nullable: true })
  deviceModel: string | null;

  @ApiProperty({ description: '등록일시', example: '2023-10-25T12:00:00.000Z' })
  @CreateDateColumn({ name: 'create_date', type: 'timestamp' })
  createDate: Date;

  @ManyToOne(() => User, (user) => user.devices, {
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE',
  })
  @JoinColumn({ name: 'user_sequence', referencedColumnName: 'sequence' })
  user: User;
}
