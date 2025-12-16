import {
  Entity,
  PrimaryColumn,
  Column,
  CreateDateColumn,
  UpdateDateColumn,
  IsNull,
} from 'typeorm';

// 소수점 데이터를 숫자로 자동 변환해주는 설정 (NULL 처리 기능 포함)
const decimalTransformer = {
  to: (value: number | null) => value, // 저장할 때
  from: (value: string | null) => (value === null ? null : parseFloat(value)), // 읽을 때
};

@Entity('food_nutrition_info')
export class FoodNutritionInfo {
  // [1] 기본 식별 정보
  @PrimaryColumn({
    name: 'food_code',
    type: 'varchar',
    length: 50,
    comment: '식품코드(Food Code)',
  })
  foodCode: string;

  @Column({
    name: 'food_name',
    type: 'varchar',
    length: 255,
    comment: '식품명(Food Name)',
  })
  foodName: string;

  @Column({
    name: 'representative_food_name',
    type: 'varchar',
    length: 255,
    nullable: true,
    comment: '대표식품명(Representative Food Name)',
  })
  representativeFoodName: string | null;

  // [2] 분류 정보
  @Column({
    name: 'category_large',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '식품대분류(Food Category Large)',
  })
  categoryLarge: string | null;

  @Column({
    name: 'category_medium',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '식품중분류(Food Category Medium)',
  })
  categoryMedium: string | null;

  @Column({
    name: 'category_small',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '식품소분류(Food Category Small)',
  })
  categorySmall: string | null;

  // [3] 제조/유통 정보
  @Column({
    name: 'manufacturer_name',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '제조사명(Manufacturer Name)',
  })
  manufacturerName: string | null;

  @Column({
    name: 'food_manufacture_number',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '식품품목제조번호',
  })
  foodManufactureNumber: string | null;

  @Column({
    name: 'importer_name',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '수입사명(Importer Name)',
  })
  importerName: string | null;

  @Column({
    name: 'distributor_name',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '유통사명(Distributor Name)',
  })
  distributorName: string | null;

  @Column({
    name: 'origin_country',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '원산지국가명(Country of Origin)',
  })
  originCountry: string | null;

  // ⚠️ SQL에 맞춰 CHAR(1)로 변경됨 (Y/N 저장)
  @Column({
    name: 'is_imported',
    type: 'char',
    length: 1,
    nullable: true,
    comment: '수입여부(Is Imported) Y / N',
  })
  isImported: string | null;

  // [4] 데이터 소스 정보
  @Column({
    name: 'source_name',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '출처명(Source Name)',
  })
  sourceName: string | null;

  @Column({
    name: 'provider_name',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '제공기관명(Provider Name)',
  })
  providerName: string | null;

  @Column({
    name: 'data_gen_method',
    type: 'varchar',
    length: 100,
    nullable: true,
    comment: '데이터생성방법(Data Generation Method)',
  })
  dataGenMethod: string | null;

  @Column({
    name: 'data_created_date',
    type: 'date',
    nullable: true,
    comment: '데이터생성일자(Data Created Date)',
  })
  dataCreatedDate: Date | null;

  // [5] 기준 규격
  @Column({
    name: 'serving_standard_amount',
    type: 'varchar',
    length: 50,
    nullable: true,
    comment: '영양성분함량기준량(Nutrient Standard Amount)',
  })
  servingStandardAmount: string | null;

  @Column({
    name: 'serving_a_amount',
    type: 'varchar',
    length: 50,
    nullable: true,
    comment: '1회 섭취 참고량(Nutrient Amount on a day)',
  })
  servingAAmount: string | null;

  @Column({
    name: 'food_a_amount',
    type: 'varchar',
    length: 50,
    nullable: true,
    comment: '식품중량',
  })
  foodAAmount: string | null;

  // [6] 영양 성분 데이터 (DECIMAL 10,3 -> Number | null)
  @Column({
    name: 'energy_kcal',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '에너지(Energy), kcal',
  })
  energyKcal: number | null;

  @Column({
    name: 'moisture_g',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '수분(Moisture), g',
  })
  moistureG: number | null;

  @Column({
    name: 'protein_g',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '단백질(Protein), g',
  })
  proteinG: number | null;

  @Column({
    name: 'fat_g',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '지방(Fat), g',
  })
  fatG: number | null;

  @Column({
    name: 'ash_g',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '회분(Ash), g',
  })
  ashG: number | null;

  @Column({
    name: 'carbohydrate_g',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '탄수화물(Carbohydrate), g',
  })
  carbohydrateG: number | null;

  @Column({
    name: 'sugar_g',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '당류(Sugars), g',
  })
  sugarG: number | null;

  @Column({
    name: 'dietary_fiber_g',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '식이섬유(Dietary Fiber), g',
  })
  dietaryFiberG: number | null;

  // 무기질
  @Column({
    name: 'calcium_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '칼슘(Calcium), mg',
  })
  calciumMg: number | null;

  @Column({
    name: 'iron_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '철(Iron), mg',
  })
  ironMg: number | null;

  @Column({
    name: 'phosphorus_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '인(Phosphorus), mg',
  })
  phosphorusMg: number | null;

  @Column({
    name: 'potassium_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '칼륨(Potassium), mg',
  })
  potassiumMg: number | null;

  @Column({
    name: 'sodium_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '나트륨(Sodium), mg',
  })
  sodiumMg: number | null;

  // 비타민
  @Column({
    name: 'vitamin_a_ug',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '비타민 A(Vitamin A), μg RAE',
  })
  vitaminAUg: number | null;

  @Column({
    name: 'retinol_ug',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '레티놀(Retinol), μg',
  })
  retinolUg: number | null;

  @Column({
    name: 'beta_carotene_ug',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '베타카로틴(Beta-carotene), μg',
  })
  betaCaroteneUg: number | null;

  @Column({
    name: 'thiamin_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '티아민(Thiamin), mg',
  })
  thiaminMg: number | null;

  @Column({
    name: 'riboflavin_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '리보플라빈(Riboflavin), mg',
  })
  riboflavinMg: number | null;

  @Column({
    name: 'niacin_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '니아신(Niacin), mg',
  })
  niacinMg: number | null;

  @Column({
    name: 'vitamin_c_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '비타민 C(Vitamin C), mg',
  })
  vitaminCMg: number | null;

  @Column({
    name: 'vitamin_d_ug',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '비타민 D(Vitamin D), μg',
  })
  vitaminDUg: number | null;

  // 지방산 및 콜레스테롤
  @Column({
    name: 'cholesterol_mg',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '콜레스테롤(Cholesterol), mg',
  })
  cholesterolMg: number | null;

  @Column({
    name: 'saturated_fat_g',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '포화지방산(Saturated Fatty Acids), g',
  })
  saturatedFatG: number | null;

  @Column({
    name: 'trans_fat_g',
    type: 'decimal',
    precision: 10,
    scale: 3,
    nullable: true,
    transformer: decimalTransformer,
    comment: '트랜스지방산(Trans Fatty Acids), g',
  })
  transFatG: number | null;

  // 시스템 관리용
  @CreateDateColumn({ name: 'created_at', comment: '생성일시(Created At)' })
  createdAt: Date;

  @UpdateDateColumn({ name: 'updated_at', comment: '수정일시(Updated At)' })
  updatedAt: Date;

  // JSON 문자열을 받아 엔티티 배열로 변환하는 정적 메서드
  static fromAIResponse(
    jsonString: string,
    foodCode: string,
  ): FoodNutritionInfo[] {
    let aiResult: any;
    try {
      aiResult = JSON.parse(jsonString);
    } catch (e) {
      console.error('JSON Parse Error:', jsonString);
      throw new Error('AI Response JSON Parsing Failed');
    }

    // 배열/단일 객체 정규화
    const rawList = Array.isArray(aiResult)
      ? aiResult
      : aiResult.foods ||
        aiResult.data ||
        (typeof aiResult === 'object' ? [aiResult] : []);

    // Helper 함수들
    const safeNum = (val: any) =>
      typeof val === 'number' ? val : Number(val) || 0;
    const cleanString = (val: any) =>
      val === 0 || val === '0' || val === 'null' || !val ? null : val;

    return rawList.map((item, index) => {
      const food = new FoodNutritionInfo();

      // 1. 식별 정보
      food.foodCode = foodCode;
      food.foodName =
        item.foodName && item.foodName !== 'null' ? item.foodName : '';
      food.representativeFoodName =
        item.representativeFoodName || food.foodName;

      // 2. 분류 정보
      food.categoryLarge = item.categoryLarge || 'AI 추천';
      food.categoryMedium = cleanString(item.categoryMedium);
      food.categorySmall = cleanString(item.categorySmall);

      // 3. 제조/유통 정보
      food.manufacturerName = cleanString(item.manufacturerName);
      food.foodManufactureNumber = cleanString(item.foodManufactureNumber);
      food.importerName = cleanString(item.importerName);
      food.distributorName = cleanString(item.distributorName);
      food.originCountry = cleanString(item.originCountry);
      food.isImported =
        item.isImported === 'Y' || item.isImported === 'y' ? 'Y' : 'N';

      // 4. 소스 정보
      food.sourceName = 'AI Analysis'; // 필요시 파라미터로 받기 가능
      food.providerName = 'Personal AI Server';
      food.dataGenMethod = 'AI Prediction';
      food.dataCreatedDate = new Date(); // 현재 시간

      // 5. 기준 규격
      food.servingStandardAmount = item.servingStandardAmount || '100g';
      food.servingAAmount = item.servingAAmount || '100g';
      food.foodAAmount = item.foodAAmount || null;

      // 6. 영양 성분 매핑
      food.energyKcal = safeNum(item.energyKcal);
      food.moistureG = safeNum(item.moistureG);
      food.proteinG = safeNum(item.proteinG);
      food.fatG = safeNum(item.fatG);
      food.ashG = safeNum(item.ashG);
      food.carbohydrateG = safeNum(item.carbohydrateG);
      food.sugarG = safeNum(item.sugarG);
      food.dietaryFiberG = safeNum(item.dietaryFiberG);
      food.calciumMg = safeNum(item.calciumMg);
      food.ironMg = safeNum(item.ironMg);
      food.phosphorusMg = safeNum(item.phosphorusMg);
      food.potassiumMg = safeNum(item.potassiumMg);
      food.sodiumMg = safeNum(item.sodiumMg);
      food.vitaminAUg = safeNum(item.vitaminAUg);
      food.retinolUg = safeNum(item.retinolUg);
      food.betaCaroteneUg = safeNum(item.betaCaroteneUg);
      food.thiaminMg = safeNum(item.thiaminMg);
      food.riboflavinMg = safeNum(item.riboflavinMg);
      food.niacinMg = safeNum(item.niacinMg);
      food.vitaminCMg = safeNum(item.vitaminCMg);
      food.vitaminDUg = safeNum(item.vitaminDUg);
      food.cholesterolMg = safeNum(item.cholesterolMg);
      food.saturatedFatG = safeNum(item.saturatedFatG);
      food.transFatG = safeNum(item.transFatG);

      return food;
    });
  }
}
