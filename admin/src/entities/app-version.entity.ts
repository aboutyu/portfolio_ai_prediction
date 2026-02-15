import { DeviceType } from 'src/types/device.type';
import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
} from 'typeorm';

@Entity('app_version')
export class AppVersion {
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true, comment: '일련번호' })
  sequence: number;

  @Column({
    type: 'char',
    length: 3,
    default: DeviceType.IOS,
    comment: 'OS 타입 (IOS, AOS 등)',
  })
  type: DeviceType;

  @Column({
    type: 'char',
    length: 1,
    name: 'is_essential',
    default: 'N',
    transformer: {
      to(value: boolean): string {
        return value ? 'Y' : 'N';
      },
      from(value: string): boolean {
        return value === 'Y';
      },
    },
    comment: '필수 업데이트 여부 (Y/N)',
  })
  isEssential: boolean;

  @Column({
    type: 'varchar',
    length: 15,
    default: '1.0.0',
    comment: '버전명 (e.g. 1.0.1)',
  })
  version: string;

  @Column({
    type: 'int',
    name: 'build_number',
    unsigned: true,
    default: 1,
    comment: '빌드 번호',
  })
  buildNumber: number;

  @CreateDateColumn({
    type: 'timestamp',
    name: 'create_date',
    default: () => 'CURRENT_TIMESTAMP',
    comment: '등록 일시',
  })
  createDate: Date;

  @Column({
    type: 'mediumtext',
    nullable: true,
    comment: '메모 및 업데이트 내용',
  })
  memo: string;
}
