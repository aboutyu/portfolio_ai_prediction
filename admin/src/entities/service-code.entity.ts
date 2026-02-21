import { ServiceCodeType } from 'src/types/service-code.type';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
} from 'typeorm';

@Entity('service_code')
export class ServiceCode {
  @PrimaryGeneratedColumn({ type: 'int', name: 'sequence' })
  sequence: number;

  @Column({ type: 'char', length: 6, unique: true, name: 'code' })
  code: string;

  @Column({
    type: 'enum',
    enum: ServiceCodeType,
    default: ServiceCodeType.ITP,
    name: 'type',
  })
  type: ServiceCodeType;

  @Column({ type: 'varchar', length: 255, name: 'name' })
  name: string;

  @Column({ type: 'varchar', length: 2, name: 'language' })
  language: string;

  @Column({ type: 'char', length: 1, default: 'Y', name: 'is_activate' })
  isActivate: string;

  @CreateDateColumn({ type: 'datetime', name: 'create_date' })
  createDate: Date;

  @Column({ type: 'mediumtext', nullable: true, name: 'memo' })
  memo?: string;
}
