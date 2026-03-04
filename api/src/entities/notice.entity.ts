import { NoticeFaqType } from 'src/helpers/enums/notice-faq-type.enum';
import { NoticeType } from 'src/helpers/enums/notice-type.enum';
import {
  Column,
  CreateDateColumn,
  Entity,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity('notice')
export class Notice {
  // 1. Sequence (PK, AI, Unsigned)
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true })
  sequence: number;

  @Column({
    type: 'varchar',
    length: 10,
    default: NoticeType.NOTICE,
    comment: 'notice: 공지사항, faq: FAQ',
  })
  type: NoticeType;

  // 3. Faq Kind (VARCHAR 10, Nullable)
  @Column({
    name: 'faq_kind',
    type: 'varchar',
    length: 10,
    default: null,
    nullable: true,
    comment: 'faq 종류 (null: all, user: 회원, service: 서비스, payment: 결제)',
  })
  faqKind?: NoticeFaqType | null;

  // 4. Title (VARCHAR 255)
  @Column({ type: 'varchar', length: 255 })
  title: string;

  // 5. Content (LONGTEXT)
  @Column({ type: 'longtext' })
  content: string;

  // 6. Create Date (DATETIME, Default CURRENT_TIMESTAMP)
  // 값이 들어갈 때 자동으로 현재 시간이 찍힙니다.
  @CreateDateColumn({ name: 'create_date', type: 'datetime' })
  createDate: Date;

  // 7. Is Activate (CHAR 1, Default 'N')
  // 코드에서는 true/false로 사용, DB에는 'Y'/'N'으로 저장
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
}
