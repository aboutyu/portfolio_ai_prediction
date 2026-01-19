import {
  Body,
  Controller,
  Delete,
  Get,
  ParseIntPipe,
  Patch,
  Post,
  Query,
  Req,
} from '@nestjs/common';
import express from 'express';
import { RecordService } from './record.service';
import { ApiBody, ApiOperation, ApiTags } from '@nestjs/swagger';
import {
  SaveFoodBatchDto,
  SaveFoodlogDto,
} from 'src/dto/record.save-foodlog.dto';
import { SaveHealthBatchDto } from 'src/dto/record.save-healthlog.dto';
import { ApiResponse } from 'src/helpers/dto/api.response.dto';
import { AccessTokenPayload } from 'src/auth/cert-token.service';

@ApiTags('기록 관련 API')
@Controller('record')
export class RecordController {
  constructor(private readonly recordService: RecordService) { }
  
  // 타임라인 날짜별 기록 조회
  @Get('timeline/list/date')
  @ApiOperation({
    summary: '타임라인 날짜별 기록 조회 API',
    description: '사용자의 타임라인을 날짜 기준으로 목록을 조회합니다.',
  })
  async getTimelineByGroupingDate(
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10,
    @Req() request: express.Request,
  ) {
    const user = request.user as AccessTokenPayload;
    if (!user) {
      throw new Error('Unauthorized');
    }
    return this.recordService.getTimelineByGroupingDate(
      user.userSequence,
      page,
      pageNum,
    );
  }

  // 타임라인 목록
  @Get('timeline')
  @ApiOperation({
    summary: '타임라인 목록 조회 API',
    description: '사용자의 타임라인 목록을 조회합니다.',
  })
  async getTimeline(
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10,
    @Req() request: express.Request,
  ) {
    const user = request.user as AccessTokenPayload;
    if (!user) {
      throw new Error('Unauthorized');
    }
    return await this.recordService.getTimeline(
      user.userSequence,
      page,
      pageNum,
    );
  }

  // 타임라인 날짜별 기록 조회
  @Get('timeline/date')
  @ApiOperation({
    summary: '타임라인 날짜별 기록 조회 API',
    description: '사용자의 특정 날짜 타임라인 기록을 조회합니다.',
  })
  async getTimelineByDate(
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10,
    @Query('date') date: string = new Date().toISOString(),
    @Req() request: express.Request,
  ) {
    const user = request.user as AccessTokenPayload;
    if (!user) {
      throw new Error('Unauthorized');
    }
    return this.recordService.getTimelineByDate(
      user.userSequence,
      date,
      page,
      pageNum,
    );
  }

  // 음식 ai 분석(AI로 음식이름 기준 칼로리 분석)
  @Get('food/analyze')
  @ApiOperation({
    summary: '음식 AI 분석 API',
    description: '사용자의 음식을 AI로 분석합니다.',
  })
  async analyzeFood(
    @Query('foodName') foodName: string,
    @Query('useModel') useModel: string = 'local',
  ): Promise<ApiResponse<any | null>> {
    if (useModel === 'gemini') {
      return this.recordService.analyzeFoodForGemini(foodName);
    }
    return this.recordService.analyzeFoodForLocal(foodName);
  }

  // 음식(식품)DB 검색
  @Get('food/search/foodname')
  @ApiOperation({
    summary: '음식 검색 API',
    description: '사용자의 음식을 검색합니다.',
  })
  async searchFoodByName(
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10,
    @Query('foodName') foodName: string,
  ) {
    return this.recordService.searchFoodByName(foodName, page, pageNum);
  }

  // 단위(unit)DB 검색
  @Get('food/search/unit')
  @ApiOperation({
    summary: '단위 검색 API',
    description: '사용자의 단위를 검색합니다.',
  })
  async searchUnitByName() {
    return this.recordService.searchUnitByName();
  }

  // 음식 저장
  @Post('food')
  @ApiOperation({
    summary: '음식 기록 저장 API',
    description: '사용자의 음식 기록을 저장합니다.',
  })
  @ApiBody({ type: SaveFoodBatchDto })
  async saveFoodRecord(
    @Body() data: SaveFoodBatchDto,
    @Req() request: express.Request,
  ) {
    const user = request.user as AccessTokenPayload;
    return this.recordService.saveFoodRecord(user.userSequence, data.records);
  }

  // 음식 수정
  @Patch('food/update')
  @ApiOperation({
    summary: '음식 기록 수정 API',
    description: '사용자의 음식 기록을 수정합니다.',
  })
  @ApiBody({ type: SaveFoodlogDto })
  async updateFoodRecord(
    @Body() data: SaveFoodlogDto,
    @Req() request: express.Request,
  ) {
    const user = request.user as AccessTokenPayload;
    return this.recordService.updateFoodRecord(user.userSequence, data);
  }

  // 음식 삭제
  @Delete('food/delete')
  @ApiOperation({
    summary: '음식 기록 삭제 API',
    description: '사용자의 음식 기록을 삭제합니다.',
  })
  async deleteFoodRecord(@Query('sequence') sequence?: number) {
    return this.recordService.deleteFoodRecord(sequence);
  }

  // 건강 저장
  @Post('health')
  @ApiOperation({
    summary: '건강 기록 저장 API',
    description: '사용자의 건강 기록을 저장합니다.',
  })
  @ApiBody({ type: SaveHealthBatchDto })
  async saveHealthRecord(
    @Body() data: SaveHealthBatchDto,
    @Req() request: express.Request,
  ) {
    const user = request.user as AccessTokenPayload;
    return this.recordService.saveHealthRecord(user.userSequence, data.records);
  }

  // 건강 수정
  @Patch('health/update')
  @ApiOperation({
    summary: '건강 기록 수정 API',
    description: '사용자의 건강 기록을 수정합니다.',
  })
  @ApiBody({ type: SaveHealthBatchDto })
  async updateHealthRecord(
    @Body() data: SaveHealthBatchDto,
    @Req() request: express.Request,
  ) {
    const user = request.user as AccessTokenPayload;
    return this.recordService.updateHealthRecord(
      user.userSequence,
      data.records,
    );
  }

  // 건강 삭제
  @Delete('health/delete')
  @ApiOperation({
    summary: '건강 기록 삭제 API',
    description: '사용자의 건강 기록을 삭제합니다.',
  })
  async deleteHealthRecord(@Query('sequence') sequence?: number) {
    return this.recordService.deleteHealthRecord(sequence);
  }
}
