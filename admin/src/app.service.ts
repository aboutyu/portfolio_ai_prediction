import { Injectable, NotFoundException } from '@nestjs/common';
import { service } from './common/utils/constants';
import * as ExcelJS from 'exceljs';
import * as fs from 'fs';
import { InjectRepository } from '@nestjs/typeorm';
import { FoodNutritionInfo } from './entities/food-nutrition-info.entity';
import { Repository } from 'typeorm';
import path from 'path';

@Injectable()
export class AppService {
  constructor(
    // FoodNutritionInfo 레포지토리 주입
    @InjectRepository(FoodNutritionInfo)
    private readonly foodRepo: Repository<FoodNutritionInfo>,
  ) {}

  async loginIndex() {
    return {
      name: service.name,
      description: service.description,
      version: service.version,
      author: service.author,
    };
  }

  async readExcelFileAndSaveItems() {
    const filePath = path.join(process.cwd(), 'src', 'assets', '식품의약품안전처_가공식품 품목별 영양성분 DB_20221231.xlsx');
    if (!fs.existsSync(filePath)) {
      throw new NotFoundException(`해당 경로에 파일이 없습니다: ${filePath}`);
    }

    const workbook = new ExcelJS.Workbook();
    await workbook.xlsx.readFile(filePath);

    const worksheet = workbook.getWorksheet(1);
    if (!worksheet) {
      throw new Error('첫 번째 시트를 찾을 수 없습니다.');
    }

    const dataList: Record<string, any>[] = [];
    const headers: { [key: number]: string } = {};
    
    worksheet.getRow(1).eachCell((cell, colNumber) => {
      headers[colNumber] = cell.text; 
    });

    worksheet.eachRow((row, rowNumber) => {
      if (rowNumber === 1) return;

      const rowData = {};
      for (const colNumber in headers) {
        const headerName = headers[colNumber];
        const cellValue = row.getCell(Number(colNumber)).value;
        rowData[headerName] = cellValue;
      }
      dataList.push(rowData);
    });

    const entities = dataList.map((row) => {
      return this.foodRepo.create({
        // [1] 기본 식별 정보
        foodCode: row['식품코드'], // PK
        foodName: row['가공식품품목명'],
        representativeFoodName: row['대표식품명'] || null,

        // [2] 분류 정보
        categoryLarge: row['식품대분류명'] || null,
        categoryMedium: row['식품중분류명'] || null,
        categorySmall: row['식품소분류명'] || null,

        // [3] 제조/유통 정보 (JSON에 없으면 null)
        manufacturerName: row['제조사명'] || null,
        importerName: row['수입사명'] || null,
        distributorName: row['유통사명'] || null,
        originCountry: row['원산지국가명'] || null,
        isImported: row['수입여부'] ? row['수입여부'] : 'N', // 없으면 N(국내)

        // [4] 데이터 소스 정보
        sourceName: row['출처명'] || null,
        providerName: row['제공기관명'] || null,
        // 줄바꿈(\n) 주의: JSON 키 그대로 입력
        dataGenMethod: row['데이터생성\n방법명'] || null, 
        // 날짜 변환: 문자열이면 Date 객체로, 없으면 null
        dataCreatedDate: row['데이터생성일자'] ? new Date(row['데이터생성일자']) : null,

        // [5] 기준 규격
        servingStandardAmount: row['영양성분기준용량'] || null,
        // 줄바꿈(\n) 주의
        servingAAmount: row['1회 \n섭취참고량'] || null,

        // [6] 영양 성분 데이터 (숫자 변환 필수)
        // 값이 없거나 이상하면 0으로 처리 (Number() || 0)
        energyKcal: this.parseNumber(row['에너지\n(kcal)']),
        moistureG: this.parseNumber(row['수분\n(g)']),
        proteinG: this.parseNumber(row['단백질\n(g)']),
        fatG: this.parseNumber(row['지방\n(g)']),
        ashG: this.parseNumber(row['회분\n(g)']),
        carbohydrateG: this.parseNumber(row['탄수화물\n(g)']),
        sugarG: this.parseNumber(row['당류\n(g)']),
        dietaryFiberG: this.parseNumber(row['식이섬유\n(g)']),

        calciumMg: this.parseNumber(row['칼슘\n(mg)']),
        ironMg: this.parseNumber(row['철\n(mg)']),
        phosphorusMg: this.parseNumber(row['인\n(mg)']),
        potassiumMg: this.parseNumber(row['칼륨\n(mg)']),
        sodiumMg: this.parseNumber(row['나트륨\n(mg)']),

        vitaminAUg: this.parseNumber(row['비타민 A\n(μg RAE)']),
        retinolUg: this.parseNumber(row['레티놀\n(μg)']),
        betaCaroteneUg: this.parseNumber(row['베타카로틴\n(μg)']),
        thiaminMg: this.parseNumber(row['티아민\n(mg)']),
        riboflavinMg: this.parseNumber(row['리보플라빈\n(mg)']),
        niacinMg: this.parseNumber(row['니아신\n(mg)']),
        vitaminCMg: this.parseNumber(row['비타민 C\n(mg)']),
        vitaminDUg: this.parseNumber(row['비타민 D\n(μg)']),

        cholesterolMg: this.parseNumber(row['콜레스테롤\n(mg)']),
        saturatedFatG: this.parseNumber(row['포화지방산\n(g)']),
        transFatG: this.parseNumber(row['트랜스지방산\n(g)']),
      });
    });

    // 2. 일괄 저장 (Batch Insert)
    // save는 존재하면 update, 없으면 insert를 수행합니다.
    // 데이터가 많을 경우 chunk(쪼개서) 저장도 고려해야 하지만, 720개는 한 번에 가능합니다.
    await this.foodRepo.save(entities);

    return {
      message: '파일 읽기 성공',
      totalCount: dataList.length,
      sample: dataList[0],
    };
  }

  async readExcelFileAndSaveFoods() {
    const filePath = path.join(process.cwd(), 'src', 'assets', '전국통합식품영양성분정보_가공식품_표준데이터-20251211.xlsx');
    if (!fs.existsSync(filePath)) {
      throw new NotFoundException(`해당 경로에 파일이 없습니다: ${filePath}`);
    }

    const workbook = new ExcelJS.Workbook();
    await workbook.xlsx.readFile(filePath);

    const worksheet = workbook.getWorksheet(1);
    if (!worksheet) {
      throw new Error('첫 번째 시트를 찾을 수 없습니다.');
    }

    const dataList: Record<string, any>[] = [];
    const headers: { [key: number]: string } = {};
    
    worksheet.getRow(1).eachCell((cell, colNumber) => {
      headers[colNumber] = cell.text; 
    });

    worksheet.eachRow((row, rowNumber) => {
      if (rowNumber === 1) return;

      const rowData = {};
      for (const colNumber in headers) {
        const headerName = headers[colNumber];
        const cellValue = row.getCell(Number(colNumber)).value;
        rowData[headerName] = cellValue;
      }
      dataList.push(rowData);
    });

const entities = dataList.map((row) => {
      return this.foodRepo.create({
        // [1] 기본 식별 정보
        foodCode: row['식품코드'],
        foodName: row['식품명'], // JSON Key 확인
        representativeFoodName: row['대표식품명'] || null,

        // [2] 분류 정보
        categoryLarge: row['식품대분류명'] || null,
        categoryMedium: row['식품중분류명'] || null,
        categorySmall: row['식품소분류명'] || null,

        // [3] 제조/유통 정보
        manufacturerName: row['제조사명'] || null,
        importerName: row['수입업체명'] || null, // JSON 키: 수입업체명
        distributorName: row['유통업체명'] || null, // JSON 키: 유통업체명
        originCountry: row['원산지국명'] || null, // JSON 키: 원산지국명
        isImported: row['수입여부'], // Y/N 처리
        foodManufactureNumber: row['품목제조보고번호'] || null, // ✅ 추가됨

        // [4] 데이터 소스 정보
        sourceName: row['출처명'] || null,
        providerName: row['제공기관명'] || null,
        dataGenMethod: row['데이터생성방법명'] || null, // JSON 키: 데이터생성방법명
        dataCreatedDate: row['데이터생성일자'] ? new Date(row['데이터생성일자']) : null,

        // [5] 기준 규격
        servingStandardAmount: row['영양성분함량기준량'] || null,
        servingAAmount: row['1회 섭취참고량'] || null,
        foodAAmount: row['식품중량'] || null, // ✅ 추가됨

        // [6] 영양 성분 데이터 (단위가 괄호로 되어있음)
        energyKcal: this.parseNumber(row['에너지(kcal)']),
        moistureG: this.parseNumber(row['수분(g)']),
        proteinG: this.parseNumber(row['단백질(g)']),
        fatG: this.parseNumber(row['지방(g)']),
        ashG: this.parseNumber(row['회분(g)']),
        carbohydrateG: this.parseNumber(row['탄수화물(g)']),
        sugarG: this.parseNumber(row['당류(g)']),
        dietaryFiberG: this.parseNumber(row['식이섬유(g)']),

        calciumMg: this.parseNumber(row['칼슘(mg)']),
        ironMg: this.parseNumber(row['철(mg)']),
        phosphorusMg: this.parseNumber(row['인(mg)']),
        potassiumMg: this.parseNumber(row['칼륨(mg)']),
        sodiumMg: this.parseNumber(row['나트륨(mg)']),

        vitaminAUg: this.parseNumber(row['비타민 A(μg RAE)']),
        retinolUg: this.parseNumber(row['레티놀(μg)']),
        betaCaroteneUg: this.parseNumber(row['베타카로틴(μg)']),
        thiaminMg: this.parseNumber(row['티아민(mg)']),
        riboflavinMg: this.parseNumber(row['리보플라빈(mg)']),
        niacinMg: this.parseNumber(row['니아신(mg)']),
        vitaminCMg: this.parseNumber(row['비타민 C(mg)']),
        vitaminDUg: this.parseNumber(row['비타민 D(μg)']),

        cholesterolMg: this.parseNumber(row['콜레스테롤(mg)']),
        saturatedFatG: this.parseNumber(row['포화지방산(g)']),
        transFatG: this.parseNumber(row['트랜스지방산(g)']),
      });
    });

    // 5만개 데이터는 한 번에 save하면 타임아웃이 날 수 있으므로 청크(Chunk) 저장 권장
    // 하지만 일단 TypeORM save는 내부적으로 분할 처리하려 시도하므로 바로 호출해봅니다.
    // 만약 "Packet too large" 에러가 나면 1000개씩 잘라서 저장해야 합니다.
    await this.foodRepo.save(entities, { chunk: 1000 });

    return {
      message: '파일 읽기 성공',
      totalCount: dataList.length,
      sample: dataList[0],
      // data: dataList,
    };
  }

  private parseNumber(value: any): number | null {
    if (!value) return null; // null, undefined, 빈 문자열 -> null

    // 1. 문자열인 경우 쉼표(,) 제거 (예: "1,200" -> "1200")
    if (typeof value === 'string') {
      value = value.replace(/,/g, '').trim();
      
      // "-" 같은 문자가 들어오면 null로 처리
      if (value === '-' || value === '') return null;
    }

    // 2. 숫자로 변환
    const num = Number(value);

    // 3. 변환 결과가 NaN이면 null 반환, 아니면 숫자 반환
    return isNaN(num) ? null : num;
  }
}
