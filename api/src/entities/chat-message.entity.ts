import {
  Entity,
  PrimaryGeneratedColumn,
  Column,
  CreateDateColumn,
} from 'typeorm';

// message_role Enum으로 정의
export enum ChatMessageRole {
  USER = 'user',
  LLAMA = 'llama',
  GEMINI = 'gemini',
}

@Entity('chat_messages')
export class ChatMessages {
  // 1. sequence (PK, int unsigned, auto_increment)
  @PrimaryGeneratedColumn({
    name: 'sequence',
    type: 'int',
    unsigned: true, // unsigned 체크 반영
  })
  sequence: number;

  // 2. message_role (varchar(10), default 'llama')
  @Column({
    name: 'message_role',
    type: 'varchar',
    length: 10,
    default: ChatMessageRole.LLAMA,
    comment: 'user, llama, gemini',
  })
  messageRole: ChatMessageRole; // Enum 타입 사용

  // 3. message (tinytext)
  @Column({
    name: 'message',
    type: 'tinytext',
  })
  message: string;

  // 4. create_time (timestamp, default CURRENT_TIMESTAMP)
  @CreateDateColumn({
    name: 'create_time',
    type: 'timestamp',
  })
  createTime: Date;

  // 5. user_sequence (int unsigned) - FK 역할
  @Column({
    name: 'user_sequence',
    type: 'int',
    unsigned: true,
  })
  userSequence: number;
}
