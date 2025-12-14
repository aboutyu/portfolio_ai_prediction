import { Entity, PrimaryColumn, Column, CreateDateColumn, UpdateDateColumn } from 'typeorm';

// 소수점 데이터를 숫자로 자동 변환해주는 설정 (NULL 처리 기능 포함)
const decimalTransformer = {
  to: (value: number | null) => value, // 저장할 때
  from: (value: string | null) => (value === null ? null : parseFloat(value)), // 읽을 때
};

@Entity('food_nutrition_info')
export class FoodNutritionInfo {
  // [1] 기본 식별 정보
  @PrimaryColumn({ name: 'food_code', type: 'varchar', length: 50, comment: '식품코드(Food Code)' })
  foodCode: string;

  @Column({ name: 'food_name', type: 'varchar', length: 255, comment: '식품명(Food Name)' })
  foodName: string;

  @Column({ name: 'representative_food_name', type: 'varchar', length: 255, nullable: true, comment: '대표식품명(Representative Food Name)' })
  representativeFoodName: string | null;

  // [2] 분류 정보
  @Column({ name: 'category_large', type: 'varchar', length: 100, nullable: true, comment: '식품대분류(Food Category Large)' })
  categoryLarge: string | null;

  @Column({ name: 'category_medium', type: 'varchar', length: 100, nullable: true, comment: '식품중분류(Food Category Medium)' })
  categoryMedium: string | null;

  @Column({ name: 'category_small', type: 'varchar', length: 100, nullable: true, comment: '식품소분류(Food Category Small)' })
  categorySmall: string | null;

  // [3] 제조/유통 정보
  @Column({ name: 'manufacturer_name', type: 'varchar', length: 100, nullable: true, comment: '제조사명(Manufacturer Name)' })
  manufacturerName: string | null;

  @Column({ name: 'food_manufacture_number', type: 'varchar', length: 100, nullable: true, comment: '식품품목제조번호' })
  foodManufactureNumber: string | null;

  @Column({ name: 'importer_name', type: 'varchar', length: 100, nullable: true, comment: '수입사명(Importer Name)' })
  importerName: string | null;

  @Column({ name: 'distributor_name', type: 'varchar', length: 100, nullable: true, comment: '유통사명(Distributor Name)' })
  distributorName: string | null;

  @Column({ name: 'origin_country', type: 'varchar', length: 100, nullable: true, comment: '원산지국가명(Country of Origin)' })
  originCountry: string | null;

  // ⚠️ SQL에 맞춰 CHAR(1)로 변경됨 (Y/N 저장)
  @Column({ name: 'is_imported', type: 'char', length: 1, nullable: true, comment: '수입여부(Is Imported) Y / N' })
  isImported: string | null;

  // [4] 데이터 소스 정보
  @Column({ name: 'source_name', type: 'varchar', length: 100, nullable: true, comment: '출처명(Source Name)' })
  sourceName: string | null;

  @Column({ name: 'provider_name', type: 'varchar', length: 100, nullable: true, comment: '제공기관명(Provider Name)' })
  providerName: string | null;

  @Column({ name: 'data_gen_method', type: 'varchar', length: 100, nullable: true, comment: '데이터생성방법(Data Generation Method)' })
  dataGenMethod: string | null;

  @Column({ name: 'data_created_date', type: 'date', nullable: true, comment: '데이터생성일자(Data Created Date)' })
  dataCreatedDate: Date | null;

  // [5] 기준 규격
  @Column({ name: 'serving_standard_amount', type: 'varchar', length: 50, nullable: true, comment: '영양성분함량기준량(Nutrient Standard Amount)' })
  servingStandardAmount: string | null;

  @Column({ name: 'serving_a_amount', type: 'varchar', length: 50, nullable: true, comment: '1회 섭취 참고량(Nutrient Amount on a day)' })
  servingAAmount: string | null;

  @Column({ name: 'food_a_amount', type: 'varchar', length: 50, nullable: true, comment: '식품중량' })
  foodAAmount: string | null;

  // [6] 영양 성분 데이터 (DECIMAL 10,3 -> Number | null)
  @Column({ name: 'energy_kcal', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '에너지(Energy), kcal' })
  energyKcal: number | null;

  @Column({ name: 'moisture_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '수분(Moisture), g' })
  moistureG: number | null;

  @Column({ name: 'protein_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '단백질(Protein), g' })
  proteinG: number | null;

  @Column({ name: 'fat_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '지방(Fat), g' })
  fatG: number | null;

  @Column({ name: 'ash_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '회분(Ash), g' })
  ashG: number | null;

  @Column({ name: 'carbohydrate_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '탄수화물(Carbohydrate), g' })
  carbohydrateG: number | null;

  @Column({ name: 'sugar_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '당류(Sugars), g' })
  sugarG: number | null;

  @Column({ name: 'dietary_fiber_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '식이섬유(Dietary Fiber), g' })
  dietaryFiberG: number | null;

  // 무기질
  @Column({ name: 'calcium_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '칼슘(Calcium), mg' })
  calciumMg: number | null;

  @Column({ name: 'iron_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '철(Iron), mg' })
  ironMg: number | null;

  @Column({ name: 'phosphorus_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '인(Phosphorus), mg' })
  phosphorusMg: number | null;

  @Column({ name: 'potassium_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '칼륨(Potassium), mg' })
  potassiumMg: number | null;

  @Column({ name: 'sodium_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '나트륨(Sodium), mg' })
  sodiumMg: number | null;

  // 비타민
  @Column({ name: 'vitamin_a_ug', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '비타민 A(Vitamin A), μg RAE' })
  vitaminAUg: number | null;

  @Column({ name: 'retinol_ug', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '레티놀(Retinol), μg' })
  retinolUg: number | null;

  @Column({ name: 'beta_carotene_ug', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '베타카로틴(Beta-carotene), μg' })
  betaCaroteneUg: number | null;

  @Column({ name: 'thiamin_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '티아민(Thiamin), mg' })
  thiaminMg: number | null;

  @Column({ name: 'riboflavin_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '리보플라빈(Riboflavin), mg' })
  riboflavinMg: number | null;

  @Column({ name: 'niacin_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '니아신(Niacin), mg' })
  niacinMg: number | null;

  @Column({ name: 'vitamin_c_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '비타민 C(Vitamin C), mg' })
  vitaminCMg: number | null;

  @Column({ name: 'vitamin_d_ug', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '비타민 D(Vitamin D), μg' })
  vitaminDUg: number | null;

  // 지방산 및 콜레스테롤
  @Column({ name: 'cholesterol_mg', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '콜레스테롤(Cholesterol), mg' })
  cholesterolMg: number | null;

  @Column({ name: 'saturated_fat_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '포화지방산(Saturated Fatty Acids), g' })
  saturatedFatG: number | null;

  @Column({ name: 'trans_fat_g', type: 'decimal', precision: 10, scale: 3, nullable: true, transformer: decimalTransformer, comment: '트랜스지방산(Trans Fatty Acids), g' })
  transFatG: number | null;

  // 시스템 관리용
  @CreateDateColumn({ name: 'created_at', comment: '생성일시(Created At)' })
  createdAt: Date;

  @UpdateDateColumn({ name: 'updated_at', comment: '수정일시(Updated At)' })
  updatedAt: Date;
}