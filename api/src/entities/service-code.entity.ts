import { ServiceCodeType } from 'src/helpers/enums/service-code-type.enum';
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

  @Column({
    name: 'is_activate',
    type: 'char',
    length: 1,
    default: 'N',
    transformer: {
      to: (value: boolean) => (value ? 'Y' : 'N'),
      from: (value: string) => value === 'Y',
    },
  })
  isActivate: boolean;

  @CreateDateColumn({ type: 'datetime', name: 'create_date' })
  createDate: Date;

  @Column({ type: 'mediumtext', nullable: true, name: 'memo' })
  memo?: string;
}
