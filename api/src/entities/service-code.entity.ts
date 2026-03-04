import { ServiceCodeType } from 'src/helpers/enums/service-code-type.enum';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
  OneToMany,
} from 'typeorm';
import { ServiceCodeTranslation } from './service-code-translation.entity';

@Entity('service_code')
export class ServiceCode {
  @PrimaryGeneratedColumn({ type: 'int', name: 'sequence' })
  sequence: number;

  @Column({ type: 'char', length: 6, unique: true, name: 'code' })
  code: string;

  @Column({ type: 'varchar', length: 45, name: 'code_name' })
  codeName: string;

  @Column({
    type: 'enum',
    enum: ServiceCodeType,
    default: ServiceCodeType.ITP,
    name: 'type',
  })
  type: ServiceCodeType;

  @Column({ name: 'is_activate', type: 'char', length: 1 })
  isActivate: string; // DB 스크린샷상 'Y'/'N' 문자열이므로 string이 안전합니다.

  @OneToMany(
    () => ServiceCodeTranslation,
    (translation) => translation.serviceCode,
  )
  translations: ServiceCodeTranslation[];
}
