import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity({ name: 'service_info' })
export class ServiceInfo {
  @Column({
    name: 'company_name',
    type: 'varchar',
    length: 255,
    nullable: true,
  })
  companyName: string | null;

  @Column({
    name: 'service_name',
    type: 'varchar',
    length: 255,
    nullable: false,
  })
  serviceName: string;

  @Column({ name: 'ceo_name', type: 'varchar', length: 255, nullable: true })
  ceoName: string | null;

  @Column({
    name: 'private_manager_name',
    type: 'varchar',
    length: 255,
    nullable: true,
  })
  privateManagerName: string | null;

  @Column({
    name: 'company_number',
    type: 'varchar',
    length: 45,
    nullable: true,
  })
  companyNumber: string | null;

  @Column({
    name: 'telecom_seller_number',
    type: 'varchar',
    length: 45,
    nullable: true,
  })
  telecomSellerNumber: string | null;

  @Column({
    name: 'company_address',
    type: 'varchar',
    length: 255,
    nullable: true,
  })
  companyAddress: string | null;

  @Column({ name: 'company_zipcode', type: 'char', length: 5, nullable: true })
  companyZipcode: string | null;

  @Column({ name: 'phone', type: 'varchar', length: 45, nullable: true })
  phone: string | null;

  @PrimaryColumn({
    name: 'language',
    type: 'char',
    length: 2,
    unique: true,
    default: 'ko',
  })
  language: string;

  @Column({ name: 'memo', type: 'mediumtext', nullable: true })
  memo?: string | null;

  @Column({ name: 'copyright', type: 'int', nullable: true })
  copyright?: number | null;

  @Column({ name: 'company_url', type: 'varchar', length: 255, nullable: true })
  companyUrl?: string | null;

  @Column({ name: 'service_url', type: 'varchar', length: 255, nullable: true })
  serviceUrl?: string | null;

  @Column({
    name: 'email',
    type: 'varchar',
    length: 255,
    nullable: true,
  })
  email?: string | null;
}
