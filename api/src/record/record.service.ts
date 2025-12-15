import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DataSource, Repository, Between, In, Like } from 'typeorm';
import { v4 as uuidv4 } from 'uuid'
import { HealthLog } from 'src/entities/health-log.entity';
import { FoodLog } from 'src/entities/food-log.entity';
import { SaveHealthlogDto } from 'src/dto/record.save-healthlog.dto';
import { SaveFoodlogDto } from 'src/dto/record.save-foodlog.dto';
import { ApiResponse } from 'src/helpers/dto/api.response.dto';
import { FailureCode, failureResponse, successResponse } from 'src/helpers/enums/status.enum';
import { TimelineGroup } from 'src/entities/timeline-group.entity';
import { FoodNutritionInfo } from 'src/entities/food-nutrition-info.entity';
import { NutrientDictionary } from 'src/entities/nutrition-dictionary.entity';

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
  ) {}
  
  private readonly foodSelection = {
    sequence: true,
    groupUuid: true,
    foodName: true,
    calories: true,
    recordDate: true,
  } as const;

  private readonly healthSelection = {
    sequence: true,
    groupUuid: true,
    healthType: true,
    healthValue: true,
    healthExtraValue: true,
  } as const;

  // 타임라인 목록
  async getTimeline(page: number = 0, pageNum: number = 10): Promise<ApiResponse<TimelineGroup[] | null>> {
    const skip = page * pageNum;

    const [timelineList, totalCount] = await this.timelineGroupRepository.findAndCount({
      where: { userSequence: 1 },
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
    return successResponse(timelineList, page, totalCount, timelineList.length,  pageNum);
  }

  // 타임라인 날짜별 기록 조회
  async getTimelineByDate(
    date: string = new Date().toISOString(),
    page: number = 0,
    pageNum: number = 10
  ): Promise<ApiResponse<TimelineGroup[] | null>> {
    const skip = page * pageNum;

    console.log(`Requested date: ${date}`);
    const { startDate: startDate, endDate: endDate } = date.getTimeToDay();

    const [timelineList, totalCount] = await this.timelineGroupRepository.findAndCount({
      where: { 
        userSequence: 1, // TODO: 실제 유저 ID
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
        foodLogs: this.foodSelection,   // 미리 정의해둔 select 객체
        healthLogs: this.healthSelection,
      },
      order: { 
        recordTime: 'DESC',
      },
      take: pageNum, 
      skip: skip, 
    });
    return successResponse(timelineList, page, totalCount, timelineList.length, pageNum);
  }

  // 음식 ai 분석
  async analyzeFood(foodName: string): Promise<ApiResponse<null>> {
    return successResponse(null);
  }

  // 음식 검색
  async searchFoodByName(
    foodName: string,
    page: number = 0,
    pageNum: number = 10
  ): Promise<ApiResponse<FoodNutritionInfo[] | null>> {
    const skip = page * pageNum;

    const [foodNutritionInfoList, totalCount] = await this.foodNutritionInfoRepository.findAndCount({
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
      const { createdAt, updatedAt, dataCreatedDate, dataGenMethod, ...resp } = food;
      return resp;
    });
    return successResponse(response as FoodNutritionInfo[], page, totalCount, response.length, pageNum);
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
  async saveFoodRecord(data: SaveFoodlogDto[]): Promise<ApiResponse<FoodLog[] | null>> {
    if (!data || data.length === 0) {
      return failureResponse(FailureCode.INVALID_PARAM);
    }

    // 이번 배치를 위한 UUID 생성
    const groupUuid = uuidv4();
    return await this.dataSource.transaction(async (manager) => {
      const processedGroupUuids = new Set<string>();
      
      // TimelineGroup에 UUID 존재 여부 확인 및 생성
      for (const item of data) {
        let finalGroupUuid = item.groupUuid;

        // =========================================================
        // CASE 1. groupUuid가 없으면 (새로운 식사) -> 그룹 무조건 추가
        // =========================================================
        if (!finalGroupUuid || finalGroupUuid.trim() === '') {
          // 부모(TimelineGroup) 저장
          await manager.save(TimelineGroup, {
            uuid: groupUuid,
            userSequence: 1, // TODO: 실제 유저 ID
            recordTime: item.recordDate,
          });
        } else {
          // =========================================================
          // CASE 2. groupUuid가 있으면 -> 존재 여부 확인 후 없으면 추가
          // =========================================================

          // 최적화: 이번 루프에서 이미 처리(확인/생성)한 UUID라면 DB 조회 패스
          if (!processedGroupUuids.has(finalGroupUuid)) {
            const existingGroup = await manager.findOne(TimelineGroup, {
              where: { uuid: finalGroupUuid },
            });

            // 그룹이 없으면 생성 (Safe Guard)
            if (!existingGroup) {
              await manager.save(TimelineGroup, {
                uuid: finalGroupUuid,
                userSequence: 1, // TODO: 실제 유저 ID
                recordTime: item.recordDate,
              });
            }
            // "이 UUID는 확인했습니다"라고 도장 찍기
            processedGroupUuids.add(finalGroupUuid);
          }
        }
      }

      // FoodLog 엔티티 생성
      const entities = data.map((item) => {
        return manager.create(FoodLog, {
          userSequence: 1,
          groupUuid: item.groupUuid ?? groupUuid,
          foodName: item.foodName,
          calories: item.calories,
          recordDate: item.recordDate,
        });
      });

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
  async updateFoodRecord(data: SaveFoodlogDto): Promise<ApiResponse<FoodLog | null>> {
    if (!data.sequence) {
      return failureResponse(FailureCode.DO_NOT_HAVE_SEQUENCE); 
    }

    const foodLog = await this.foodLogRepository.findOne({
      where: { 
        sequence: data.sequence, 
        userSequence: 1
      }
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
  async deleteFoodRecord(sequence?: number): Promise<ApiResponse<FoodLog | null>> {
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
            console.log(`[Transaction] Empty group deleted via FoodLog: ${targetGroupUuid}`);
          }
        }
      }
      return successResponse(foodLog);
    });
  }

  // 건강 저장
  async saveHealthRecord(data: SaveHealthlogDto[]): Promise<ApiResponse<HealthLog[] | null>> {
    const groupUuid = uuidv4();
    const entities = data.map((item) => {
      return this.healthLogRepository.create({
        userSequence: 1,
        groupUuid: groupUuid,
        healthType: item.healthType,
        healthValue: item.healthValue,
        healthExtraValue: item.healthExtraValue,
        deviceType: item.deviceType,
        recordDate: item.recordDate,
      });
    });

    const savedHealths = await this.healthLogRepository.save(entities);
    if (!savedHealths) {
      return failureResponse(FailureCode.NOT_IMPLEMENTED);
    }

    const response = savedHealths.map((health) => {
      const { userSequence, createDate, ...resp } = health;
      return resp;
    });
    
    return successResponse(response as HealthLog[]);
  }

  // 건강 수정
  async updateHealthRecord(data: SaveHealthlogDto): Promise<ApiResponse<HealthLog | null>> {
    if (!data.sequence) {
      return failureResponse(FailureCode.DO_NOT_HAVE_SEQUENCE); 
    }

    const healthLog = await this.healthLogRepository.findOne({
      where: { 
        sequence: data.sequence, 
        userSequence: 1
      }
    });

    if (!healthLog) {
      return failureResponse(FailureCode.DO_NOT_HAVE_DATA);
    }

    healthLog.healthType = data.healthType;
    healthLog.healthValue = data.healthValue;
    healthLog.healthExtraValue = data.healthExtraValue;
    healthLog.deviceType = data.deviceType;
    healthLog.recordDate = data.recordDate;

    const updatedHealth = await this.healthLogRepository.save(healthLog);
    const { userSequence, createDate, ...response } = updatedHealth;
    
    return successResponse(response as HealthLog);
  }

  // 건강 삭제
  async deleteHealthRecord(sequence?: number): Promise<ApiResponse<HealthLog | null>> {
    if (sequence === undefined) {
      return failureResponse(FailureCode.DO_NOT_HAVE_SEQUENCE);
    }

    // 트랜잭션으로 안전성 확보
    return await this.dataSource.transaction(async (manager) => {
      const healthLog = await manager.findOne(HealthLog, { where: { sequence } });

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
            console.log(`[Transaction] Empty group deleted: ${targetGroupUuid}`);
          }
        }
      }
      return successResponse(healthLog);
    });
  }
}
