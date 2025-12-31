import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DataSource, Repository, Between, In, Like, IsNull } from 'typeorm';
import { v4 as uuidv4 } from 'uuid';
import { HealthLog } from 'src/entities/health-log.entity';
import { FoodLog } from 'src/entities/food-log.entity';
import { SaveHealthlogDto } from 'src/dto/record.save-healthlog.dto';
import { SaveFoodlogDto } from 'src/dto/record.save-foodlog.dto';
import { ApiResponse } from 'src/helpers/dto/api.response.dto';
import {
  FailureCode,
  failureResponse,
  successResponse,
} from 'src/helpers/enums/status.enum';
import { TimelineGroup } from 'src/entities/timeline-group.entity';
import { FoodNutritionInfo } from 'src/entities/food-nutrition-info.entity';
import { NutrientDictionary } from 'src/entities/nutrition-dictionary.entity';
import { Ollama } from 'ollama';
import { FoodAnalysisPrompt } from 'src/helpers/prompts/food-analysis.prompt';
import { GoogleGenerativeAI } from '@google/generative-ai';

@Injectable()
export class RecordService {
  constructor(
    @InjectRepository(TimelineGroup)
    private readonly timelineGroupRepository: Repository<TimelineGroup>,

    @InjectRepository(FoodLog)
    private readonly foodLogRepository: Repository<FoodLog>,

    @InjectRepository(HealthLog)
    private readonly healthLogRepository: Repository<HealthLog>,

    @InjectRepository(FoodNutritionInfo)
    private readonly foodNutritionInfoRepository: Repository<FoodNutritionInfo>,

    @InjectRepository(NutrientDictionary)
    private readonly nutrientDictionaryRepository: Repository<NutrientDictionary>,

    private readonly dataSource: DataSource,
  ) {
    // Ollama 클라이언트 초기화
    this.ollamaClient = new Ollama({
      host: process.env.AI_API_URL || 'http://localhost:11434',
    });

    // Google AI 클라이언트 초기화
    this.genAI = new GoogleGenerativeAI(process.env.GEMINI_API_KEY || '');
  }

  private readonly foodSelection = {
    sequence: true,
    groupUuid: true,
    foodName: true,
    calories: true,
    recordDate: true,
    memo: true,
  } as const;

  private readonly healthSelection = {
    sequence: true,
    groupUuid: true,
    healthType: true,
    healthValue: true,
    healthExtraValue: true,
    recordDate: true,
    memo: true,
  } as const;

  private readonly ollamaClient: Ollama;
  private genAI: GoogleGenerativeAI;

  // 타임라인 목록
  async getTimeline(
    userSequence: number,
    page: number = 0,
    pageNum: number = 10,
  ): Promise<ApiResponse<TimelineGroup[] | null>> {
    const skip = page * pageNum;

    const [timelineList, totalCount] =
      await this.timelineGroupRepository.findAndCount({
        where: { userSequence },
        relations: {
          foodLogs: true,
          healthLogs: true,
        },
        select: {
          uuid: true,
          recordTime: true,
          memo: true,
          foodLogs: this.foodSelection,
          healthLogs: this.healthSelection,
        },
        order: {
          recordTime: 'DESC',
        },
        take: pageNum,
        skip: skip,
      });
    return successResponse(
      timelineList,
      page,
      totalCount,
      timelineList.length,
      pageNum,
    );
  }

  // 타임라인 날짜별 기록 조회
  async getTimelineByDate(
    userSequence: number,
    date: string = new Date().toISOString(),
    page: number = 0,
    pageNum: number = 10,
  ): Promise<ApiResponse<TimelineGroup[] | null>> {
    const skip = page * pageNum;
    const { startDate: startDate, endDate: endDate } = date.getTimeToDay();

    const [timelineList, totalCount] =
      await this.timelineGroupRepository.findAndCount({
        where: {
          userSequence,
          recordTime: Between(startDate, endDate),
        },
        relations: {
          foodLogs: true,
          healthLogs: true,
        },
        select: {
          uuid: true,
          recordTime: true,
          memo: true,
          foodLogs: this.foodSelection, // 미리 정의해둔 select 객체
          healthLogs: this.healthSelection,
        },
        order: {
          recordTime: 'DESC',
        },
        take: pageNum,
        skip: skip,
      });
    return successResponse(
      timelineList,
      page,
      totalCount,
      timelineList.length,
      pageNum,
    );
  }

  // 음식 ai 분석
  async analyzeFoodForGemini(foodName: string): Promise<ApiResponse<any>> {
    try {
      const model = this.genAI.getGenerativeModel({
        model: 'gemini-flash-latest',
        generationConfig: {
          responseMimeType: 'application/json',
          temperature: 0.3, // 창의성 낮춤(정확도 UP)
        },
      });

      const prompt = FoodAnalysisPrompt.getAnalysisPrompt(foodName);
      const result = await model.generateContent(prompt);
      const response = await result.response;
      const text = response.text();

      const foodCode = `GEMINI_${new Date().getTime()}`;
      const foods = FoodNutritionInfo.fromAIResponse(text, foodCode);
      console.log('Gemini AI Response:', foods);

      await this.saveFoodsIfNotExist(foods);

      return successResponse(foods);
    } catch (error) {
      console.error('Gemini API Error:', error);
      return failureResponse(FailureCode.NOT_IMPLEMENTED);
    }
  }

  async analyzeFoodForLocal(
    foodName: string,
  ): Promise<ApiResponse<FoodNutritionInfo[] | null>> {
    try {
      const prompt = FoodAnalysisPrompt.getAnalysisPrompt(foodName);
      const response = await this.ollamaClient.chat({
        model: process.env.AI_MODEL || 'llama3.2:1b',
        format: 'json',
        stream: false,
        messages: [{ role: 'user', content: prompt }],
      });
      const content = response.message.content;

      const foodCode = `OLLAMA_${new Date().getTime()}`;
      const foods = FoodNutritionInfo.fromAIResponse(content, foodCode);
      console.log('AI Processed Foods:', foods);

      await this.saveFoodsIfNotExist(foods);

      return successResponse(foods);
    } catch (error) {
      console.error('AI Processing Error:', error);
      return failureResponse(FailureCode.NOT_IMPLEMENTED);
    }
  }

  private async saveFoodsIfNotExist(foods: FoodNutritionInfo[]): Promise<void> {
    const newFoods: FoodNutritionInfo[] = [];

    for (const food of foods) {
      // 1. DB에서 동일한 조건의 데이터가 있는지 조회
      const existingFood = await this.foodNutritionInfoRepository.findOne({
        where: {
          foodName: food.foodName,
          representativeFoodName:
            food.representativeFoodName === null
              ? IsNull()
              : food.representativeFoodName,
          energyKcal: food.energyKcal === null ? IsNull() : food.energyKcal,
          foodAAmount: food.foodAAmount === null ? IsNull() : food.foodAAmount,
        },
      });

      if (!existingFood) {
        newFoods.push(food);
      }
    }

    if (newFoods.length > 0) {
      await this.foodNutritionInfoRepository.save(newFoods);
      console.log(
        `[Save] ${newFoods.length}건의 새로운 음식 데이터가 저장되었습니다.`,
      );
    } else {
      console.log('[Skip] 중복된 데이터이므로 저장을 건너뜁니다.');
    }
  }

  // 음식 검색
  async searchFoodByName(
    foodName: string,
    page: number = 0,
    pageNum: number = 10,
  ): Promise<ApiResponse<FoodNutritionInfo[] | null>> {
    const skip = page * pageNum;

    const [foodNutritionInfoList, totalCount] =
      await this.foodNutritionInfoRepository.findAndCount({
        where: {
          foodName: Like(`%${foodName}%`),
        },
        order: {
          foodName: 'DESC',
        },
        take: pageNum,
        skip: skip,
      });

    const response = foodNutritionInfoList.map((food) => {
      const { createdAt, updatedAt, dataCreatedDate, dataGenMethod, ...resp } =
        food;
      return resp;
    });
    return successResponse(
      response as FoodNutritionInfo[],
      page,
      totalCount,
      response.length,
      pageNum,
    );
  }

  // 단위 검색
  async searchUnitByName(): Promise<ApiResponse<NutrientDictionary[] | null>> {
    const unitList = await this.nutrientDictionaryRepository.find({
      order: {
        displayOrder: 'ASC',
      },
    });
    return successResponse(unitList);
  }

  // 음식 저장
  async saveFoodRecord(
    data: SaveFoodlogDto[],
  ): Promise<ApiResponse<FoodLog[] | null>> {
    if (!data || data.length === 0) {
      return failureResponse(FailureCode.INVALID_PARAM);
    }

    return await this.dataSource.transaction(async (manager) => {
      // 1. 메모리 캐시: "YYYY-MM-DD" -> "GroupUUID"
      // (루프 내에서 같은 날짜가 반복되면 DB 조회를 줄이기 위함)
      const dateToGroupUuidMap = new Map<string, string>();

      const entities: FoodLog[] = [];

      // ⚠️ 중요: map 대신 for...of를 써야 내부에서 await가 정상 작동합니다.
      for (const item of data) {
        // =========================================================
        // 1. 날짜 문자열 결정 (클라이언트 값 우선 -> 없으면 recordDate 기준)
        // =========================================================
        let targetDateString = item.timelineDate;

        if (!targetDateString) {
          // null이면 recordDate(UTC)에서 날짜만 뽑아서 사용 ("2025-12-30")
          const dateObj = new Date(item.recordDate);
          targetDateString = dateObj.toISOString().split('T')[0];
        }

        // =========================================================
        // 2. 그룹 기준 시간 생성 (UTC 00:00:00 고정)
        // =========================================================
        // "2025-12-30" -> Date(2025-12-30T00:00:00.000Z)
        const targetGroupDate = new Date(`${targetDateString}T00:00:00Z`);

        // =========================================================
        // 3. 그룹 UUID 찾기 (메모리 -> DB -> 생성)
        // =========================================================
        let groupUuid = dateToGroupUuidMap.get(targetDateString);

        if (!groupUuid) {
          // A. DB 조회: 해당 날짜(UTC 0시)의 그룹이 있는지 확인
          let existingGroup = await manager.findOne(TimelineGroup, {
            where: {
              userSequence: 1, // TODO: 실제 유저 ID
              recordTime: targetGroupDate,
            },
          });

          // B. 없으면 생성
          if (!existingGroup) {
            const newUuid = uuidv4();
            existingGroup = await manager.save(TimelineGroup, {
              uuid: newUuid,
              userSequence: 1,
              // 그룹 날짜는 무조건 UTC 0시로 저장 (약속)
              recordTime: targetGroupDate,
            });
          }

          groupUuid = existingGroup.uuid;
          // 다음 루프를 위해 메모리에 저장
          dateToGroupUuidMap.set(targetDateString, groupUuid);
        }

        // =========================================================
        // 4. FoodLog 엔티티 생성 (배열에 담기)
        // =========================================================
        entities.push(
          manager.create(FoodLog, {
            userSequence: 1,
            groupUuid: groupUuid, // 찾아낸(혹은 만든) UUID 사용
            foodName: item.foodName,
            calories: item.calories,
            recordDate: item.recordDate, // 실제 식사 시간
            memo: item.memo, // 메모 필드가 있다면 추가
          }),
        );
      }

      // =========================================================
      // 5. 일괄 저장
      // =========================================================
      const savedFoods = await manager.save(FoodLog, entities);

      if (!savedFoods) {
        return failureResponse(FailureCode.NOT_IMPLEMENTED);
      }

      const response = savedFoods.map((food) => {
        const { userSequence, createDate, ...resp } = food;
        return resp;
      });

      return successResponse(response as FoodLog[]);
    });
  }
  // 음식 수정
  async updateFoodRecord(
    data: SaveFoodlogDto,
  ): Promise<ApiResponse<FoodLog | null>> {
    if (!data.sequence) {
      return failureResponse(FailureCode.DO_NOT_HAVE_SEQUENCE);
    }

    const foodLog = await this.foodLogRepository.findOne({
      where: {
        sequence: data.sequence,
        userSequence: 1,
      },
    });

    if (!foodLog) {
      return failureResponse(FailureCode.DO_NOT_HAVE_DATA);
    }

    foodLog.foodName = data.foodName;
    foodLog.calories = data.calories;
    foodLog.recordDate = data.recordDate;

    const updatedFood = await this.foodLogRepository.save(foodLog);
    const { userSequence, createDate, ...response } = updatedFood;

    return successResponse(response as FoodLog);
  }

  // 음식 삭제
  async deleteFoodRecord(
    sequence?: number,
  ): Promise<ApiResponse<FoodLog | null>> {
    if (sequence === undefined) {
      return failureResponse(FailureCode.DO_NOT_HAVE_SEQUENCE);
    }

    // 트랜잭션으로 안전성 확보
    return await this.dataSource.transaction(async (manager) => {
      const foodLog = await manager.findOne(FoodLog, { where: { sequence } });

      if (!foodLog) {
        return failureResponse(FailureCode.NOT_IMPLEMENTED);
      }

      const targetGroupUuid = foodLog.groupUuid;
      const deleteResult = await manager.delete(FoodLog, { sequence });

      if (deleteResult.affected === 0) {
        return failureResponse(FailureCode.NOT_IMPLEMENTED);
      }

      if (targetGroupUuid) {
        const foodCount = await manager.count(FoodLog, {
          where: { groupUuid: targetGroupUuid },
        });

        if (foodCount === 0) {
          const healthCount = await manager.count(HealthLog, {
            where: { groupUuid: targetGroupUuid },
          });

          if (healthCount === 0) {
            await manager.delete(TimelineGroup, { uuid: targetGroupUuid });
            console.log(
              `[Transaction] Empty group deleted via FoodLog: ${targetGroupUuid}`,
            );
          }
        }
      }
      return successResponse(foodLog);
    });
  }

  // 건강 저장
  async saveHealthRecord(
    data: SaveHealthlogDto[],
  ): Promise<ApiResponse<HealthLog[] | null>> {
    return await this.dataSource.transaction(async (manager) => {
      // 메모리 캐시: "YYYY-MM-DD" -> "GroupUUID"
      const dateToGroupUuidMap = new Map<string, string>();
      const entities: HealthLog[] = [];

      for (const item of data) {
        // =========================================================
        // 1. 날짜 문자열 결정 (클라이언트 값 우선 -> 없으면 recordDate 기준)
        // =========================================================
        let targetDateString = item.timelineDate;

        if (!targetDateString) {
          // null이면 recordDate(UTC)에서 날짜만 뽑아서 사용 ("2025-12-30")
          const dateObj = new Date(item.recordDate);
          targetDateString = dateObj.toISOString().split('T')[0];
        }

        // =========================================================
        // 2. 그룹 기준 시간 생성 (UTC 00:00:00 고정)
        // =========================================================
        // "2025-12-30" -> Date(2025-12-30T00:00:00.000Z)
        const targetGroupDate = new Date(`${targetDateString}T00:00:00Z`);

        // =========================================================
        // 3. 그룹 UUID 찾기 (메모리 -> DB -> 생성)
        // =========================================================
        let groupUuid = dateToGroupUuidMap.get(targetDateString);

        if (!groupUuid) {
          // A. DB 조회
          let existingGroup = await manager.findOne(TimelineGroup, {
            where: {
              userSequence: 1, // TODO: User ID
              // DB에 저장된 UTC 0시 값과 비교
              recordTime: targetGroupDate,
            },
          });

          // B. 없으면 생성
          if (!existingGroup) {
            const newUuid = uuidv4();
            existingGroup = await manager.save(TimelineGroup, {
              uuid: newUuid,
              userSequence: 1,
              // 그룹 날짜는 무조건 UTC 0시로 저장 (약속)
              recordTime: targetGroupDate,
            });
          }

          groupUuid = existingGroup.uuid;
          // 다음 루프를 위해 메모리에 저장
          dateToGroupUuidMap.set(targetDateString, groupUuid);
        }

        entities.push(
          this.healthLogRepository.create({
            userSequence: 1,
            groupUuid: item.groupUuid || groupUuid,
            healthType: item.healthType,
            healthValue: item.healthValue,
            healthExtraValue: item.healthExtraValue,
            deviceType: item.deviceType,
            recordDate: item.recordDate,
            memo: item.memo,
          }),
        );
      }

      const savedHealths = await this.healthLogRepository.save(entities);
      if (!savedHealths) {
        return failureResponse(FailureCode.NOT_IMPLEMENTED);
      }

      const response = savedHealths.map((health) => {
        const { ...resp } = health;
        return resp;
      });

      return successResponse(response as HealthLog[]);
    });
  }

  // 건강 수정
  async updateHealthRecord(
    dtos: SaveHealthlogDto[], // 👈 파라미터를 배열로 변경 (이름도 data -> dtos로 명확하게)
  ): Promise<ApiResponse<HealthLog[] | null>> {
    // 👈 반환 타입도 단일 객체에서 배열([])로 변경

    const updatedLogs: HealthLog[] = []; // 업데이트된 결과들을 담을 리스트

    // 1. 배열을 순회하며 하나씩 처리
    for (const data of dtos) {
      // (1) Sequence 유효성 검사 (없으면 해당 건은 스킵하거나 에러 처리)
      if (!data.sequence) {
        // continue; // 시퀀스가 없으면 무시하고 다음 데이터로 넘어감
        return failureResponse(FailureCode.DO_NOT_HAVE_SEQUENCE);
      }

      // (2) 수정할 대상 찾기
      const healthLog = await this.healthLogRepository.findOne({
        where: {
          sequence: data.sequence,
          userSequence: 1, // ⚠️ 실제 서비스에선 user.id 사용 권장
        },
      });

      // (3) 데이터가 없으면 스킵
      if (!healthLog) {
        continue;
      }

      // (4) 데이터 병합 (Object.assign)
      Object.assign(healthLog, {
        healthValue: data.healthValue,
        healthExtraValue: data.healthExtraValue,
        deviceType: data.deviceType,
        recordDate: data.recordDate,
        // 필요하다면 healthType 등 다른 필드도 추가
      });

      // (5) 저장 및 결과 리스트에 추가
      const savedLog = await this.healthLogRepository.save(healthLog);
      updatedLogs.push(savedLog);
    }

    // 2. 결과가 하나도 없다면 에러 처리 (선택 사항)
    if (updatedLogs.length === 0) {
      return failureResponse(FailureCode.DO_NOT_HAVE_DATA);
    }

    // 3. 업데이트된 리스트 반환
    // (userSequence 등 민감 정보 제거 로직이 필요하면 map으로 처리)
    const response = updatedLogs.map((log) => {
      const { ...rest } = log;
      return rest as HealthLog;
    });

    return successResponse(response);
  }

  // 건강 삭제
  async deleteHealthRecord(
    sequence?: number,
  ): Promise<ApiResponse<HealthLog | null>> {
    if (sequence === undefined) {
      return failureResponse(FailureCode.DO_NOT_HAVE_SEQUENCE);
    }

    // 트랜잭션으로 안전성 확보
    return await this.dataSource.transaction(async (manager) => {
      const healthLog = await manager.findOne(HealthLog, {
        where: { sequence },
      });

      if (!healthLog) {
        return failureResponse(FailureCode.NOT_IMPLEMENTED);
      }

      const targetGroupUuid = healthLog.groupUuid;
      const deleteResult = await manager.delete(HealthLog, { sequence });

      if (deleteResult.affected === 0) {
        return failureResponse(FailureCode.NOT_IMPLEMENTED);
      }

      // 고아 그룹 정리 (Orphan Removal)
      if (targetGroupUuid) {
        const healthCount = await manager.count(HealthLog, {
          where: { groupUuid: targetGroupUuid },
        });

        if (healthCount === 0) {
          const foodCount = await manager.count(FoodLog, {
            where: { groupUuid: targetGroupUuid },
          });

          if (foodCount === 0) {
            await manager.delete(TimelineGroup, { uuid: targetGroupUuid });
            console.log(
              `[Transaction] Empty group deleted: ${targetGroupUuid}`,
            );
          }
        }
      }
      return successResponse(healthLog);
    });
  }
}
