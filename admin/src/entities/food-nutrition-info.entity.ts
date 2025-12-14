import { Entity, PrimaryColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

const decimalTransformer = {
  to: (value: number | null) => value,
  from: (value: string) => (value === null ? null : parseFloat(value)),
};

@Entity('food_nutrition_info')
export class FoodNutritionInfo {
  // [1] 기본 식별 정보
  @PrimaryColumn({ name: 'food_code', type: 'varchar', length: 50, comment: '식품코드(PK)' })
  foodCode: string;

  @Column({ name: 'food_name', type: 'varchar', length: 255, comment: '식품명' })
  foodName: string;

  @Column({ name: 'representative_food_name', type: 'varchar', length: 255, nullable: true, comment: '대표식품명' })
  representativeFoodName: string | null;

  // [2] 분류 정보
  @Column({ name: 'category_large', type: 'varchar', length: 100, nullable: true, comment: '식품대분류' })
  categoryLarge: string | null;

  @Column({ name: 'category_medium', type: 'varchar', length: 100, nullable: true, comment: '식품중분류' })
  categoryMedium: string | null;

  @Column({ name: 'category_small', type: 'varchar', length: 100, nullable: true, comment: '식품소분류' })
  categorySmall: string | null;

  // [3] 제조/유통 정보
  @Column({ name: 'manufacturer_name', type: 'varchar', length: 100, nullable: true, comment: '제조사명' })
  manufacturerName: string | null;

  @Column({ name: 'importer_name', type: 'varchar', length: 100, nullable: true, comment: '수입사명' })
  importerName: string | null;

  @Column({ name: 'distributor_name', type: 'varchar', length: 100, nullable: true, comment: '유통사명' })
  distributorName: string | null;

  @Column({ name: 'origin_country', type: 'varchar', length: 100, nullable: true, comment: '원산지국가명' })
  originCountry: string | null;

  @Column({ name: 'is_imported', type: 'tinyint', default: 0, comment: '수입여부(0:국내, 1:수입)' })
  isImported: number;

  // ✅ [Turn 24 추가 필드] 품목제조보고번호
  @Column({ name: 'food_manufacture_number', type: 'varchar', length: 50, nullable: true, comment: '품목제조보고번호' })
  foodManufactureNumber: string | null;

  // [4] 데이터 소스 정보
  @Column({ name: 'source_name', type: 'varchar', length: 100, nullable: true, comment: '출처명' })
  sourceName: string | null;

  @Column({ name: 'provider_name', type: 'varchar', length: 100, nullable: true, comment: '제공기관명' })
  providerName: string | null;

  @Column({ name: 'data_gen_method', type: 'varchar', length: 100, nullable: true, comment: '데이터생성방법' })
  dataGenMethod: string | null;

  @Column({ name: 'data_created_date', type: 'date', nullable: true, comment: '데이터생성일자' })
  dataCreatedDate: Date | null;

  // [5] 기준 규격
  @Column({ name: 'serving_standard_amount', type: 'varchar', length: 50, nullable: true, comment: '영양성분함량기준량' })
  servingStandardAmount: string | null;

  @Column({ name: 'serving_a_amount', type: 'varchar', length: 50, nullable: true, comment: '1회 섭취참고량' })
  servingAAmount: string | null;

  // ✅ [Turn 24 추가 필드] 식품중량
  @Column({ name: 'food_a_amount', type: 'varchar', length: 50, nullable: true, comment: '식품중량' })
  foodAAmount: string | null;

  // [6] 영양 성분 데이터 (DECIMAL 10,3)
  // ✅ 수정사항: nullable: true 추가, default: 0 제거, 타입 number | null로 변경
  
  @Column({ name: 'energy_kcal', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  energyKcal: number | null;

  @Column({ name: 'moisture_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  moistureG: number | null;

  @Column({ name: 'protein_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  proteinG: number | null;

  @Column({ name: 'fat_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  fatG: number | null;

  @Column({ name: 'ash_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  ashG: number | null;

  @Column({ name: 'carbohydrate_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  carbohydrateG: number | null;

  @Column({ name: 'sugar_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  sugarG: number | null;

  @Column({ name: 'dietary_fiber_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  dietaryFiberG: number | null;

  // 무기질
  @Column({ name: 'calcium_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  calciumMg: number | null;

  @Column({ name: 'iron_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  ironMg: number | null;

  @Column({ name: 'phosphorus_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  phosphorusMg: number | null;

  @Column({ name: 'potassium_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  potassiumMg: number | null;

  @Column({ name: 'sodium_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  sodiumMg: number | null;

  // 비타민
  @Column({ name: 'vitamin_a_ug', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  vitaminAUg: number | null;

  @Column({ name: 'retinol_ug', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  retinolUg: number | null;

  @Column({ name: 'beta_carotene_ug', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  betaCaroteneUg: number | null;

  @Column({ name: 'thiamin_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  thiaminMg: number | null;

  @Column({ name: 'riboflavin_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  riboflavinMg: number | null;

  @Column({ name: 'niacin_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  niacinMg: number | null;

  @Column({ name: 'vitamin_c_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  vitaminCMg: number | null;

  @Column({ name: 'vitamin_d_ug', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  vitaminDUg: number | null;

  // 지방산 및 콜레스테롤
  @Column({ name: 'cholesterol_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  cholesterolMg: number | null;

  @Column({ name: 'saturated_fat_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  saturatedFatG: number | null;

  @Column({ name: 'trans_fat_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer })
  transFatG: number | null;

  // 시스템 관리용
  @CreateDateColumn({ name: 'created_at' })
  createdAt: Date;

  @UpdateDateColumn({ name: 'updated_at' })
  updatedAt: Date;
}