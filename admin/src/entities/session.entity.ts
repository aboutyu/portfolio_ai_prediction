import { Column, Entity, Index, PrimaryColumn } from 'typeorm';

@Entity('sessions')
export class Sessions {
  @PrimaryColumn('varchar', { length: 255 })
  id: string;

  @Index()
  @Column('bigint', { name: 'expired_at' })
  expiredAt: number;

  @Column('text')
  json: string;
}
