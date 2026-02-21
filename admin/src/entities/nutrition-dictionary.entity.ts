import { Entity, PrimaryColumn, Column } from 'typeorm';

@Entity('nutrient_dictionary')
export class NutrientDictionary {
  // [PK] 영양성분 코드 (예: energy_kcal, protein_g)
  @PrimaryColumn({
    name: 'code',
    type: 'varchar',
    length: 50,
    comment: '매핑할 DB 컬럼명 (PK)',
  })
  code: string;

  // 영양성분명 (한글)
  @Column({
    name: 'name_ko',
    type: 'varchar',
    length: 50,
    nullable: false,
    comment: '영양성분명(한글)',
  })
  nameKo: string;

  // 영양성분명 (영어)
  @Column({
    name: 'name_en',
    type: 'varchar',
    length: 100,
    nullable: false,
    comment: '영양성분명(영어)',
  })
  nameEn: string;

  // 단위
  @Column({
    name: 'unit',
    type: 'varchar',
    length: 10,
    nullable: false,
    comment: '단위 (g, mg, ug 등)',
  })
  unit: string;

  // 표시 순서 (기본값 0)
  @Column({
    name: 'display_order',
    type: 'int',
    default: 0,
    comment: '화면 표시 순서',
  })
  displayOrder: number;
}
