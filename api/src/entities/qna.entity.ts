import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
} from 'typeorm';

@Entity('qna')
export class Qna {
  @PrimaryGeneratedColumn({ type: 'int', unsigned: true, comment: '일련번호' })
  sequence: number;

  @Column({
    type: 'mediumtext',
    comment: '질문 내용',
  })
  question: string;

  @CreateDateColumn({
    type: 'timestamp',
    name: 'question_date',
    default: () => 'CURRENT_TIMESTAMP',
    comment: '질문 등록 일시',
  })
  questionDate: Date;

  @Column({
    type: 'mediumtext',
    nullable: true,
    comment: '답변 내용',
  })
  answer: string;

  @Column({
    type: 'varchar',
    length: 45,
    name: 'answer_date',
    nullable: true,
    comment: '답변 등록 일시 (문자열 형식)',
  })
  answerDate: string;

  @Column({
    type: 'int',
    name: 'user_sequence',
    unsigned: true,
    comment: '질문자(유저) 일련번호',
  })
  userSequence: number;

  @Column({
    type: 'int',
    name: 'admin_sequence',
    nullable: true,
    comment: '답변자(관리자) 일련번호',
  })
  adminSequence: number;
}
