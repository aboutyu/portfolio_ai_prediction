import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { ServiceCode } from './service-code.entity';

// service-code-translation.entity.ts
@Entity('service_code_translation')
export class ServiceCodeTranslation {
  @PrimaryGeneratedColumn({ name: 'sequence' }) // DB 스크린샷 기준 PK는 sequence입니다.
  sequence: number;

  @Column({ name: 'language', type: 'char', length: 3 })
  language: string;

  @Column({ name: 'name', type: 'varchar', length: 255 })
  name: string;

  // 실제 DB 컬럼명인 'service_code_sequence'를 명시해야 합니다.
  @Column({ name: 'service_code_sequence' })
  serviceCodeSequence: number;

  @ManyToOne(() => ServiceCode, (serviceCode) => serviceCode.translations)
  @JoinColumn({ name: 'service_code_sequence' }) // 외래키 연결 통로 지정
  serviceCode: ServiceCode;
}
