import { Expose } from 'class-transformer';
import { TermsType, TermsTypeName } from 'src/helpers/enums/terms-type.enum';
import {
  AfterLoad,
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity('terms')
export class Terms {
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true })
  sequence: number;

  @Column({
    type: 'varchar',
    length: 10,
    default: TermsType.SERVICE,
  })
  type: TermsType;

  @Column({ type: 'varchar', length: 255, default: '서비스 이용약관' })
  title: string;

  @Column({ type: 'mediumtext' })
  content: string;

  @Column({
    name: 'is_required',
    type: 'char',
    length: 1,
    default: 'Y',
    comment: 'Y: 필수\nN: 선택',
    transformer: {
      to(value: boolean): string {
        return value ? 'Y' : 'N';
      },
      from(value: string): boolean {
        return value === 'Y';
      },
    },
  })
  isRequired: boolean;

  @Column({
    name: 'is_activate',
    type: 'char',
    length: 1,
    default: 'Y',
    comment: 'Y: 활성화\nN: 비활성화',
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

  @CreateDateColumn({ name: 'create_date', type: 'datetime' })
  createDate: Date;

  // DB에서 로드된 후(AfterLoad) 자동으로 값 채우기(DB 컬럼에 존재하지 않음)
  termsName: string;

  @AfterLoad()
  setTermsName() {
    this.termsName = TermsTypeName[this.type] || this.type;
  }
}
