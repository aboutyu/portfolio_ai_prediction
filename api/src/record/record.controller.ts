import { Body, Controller, Delete, Get, Param, ParseArrayPipe, ParseIntPipe, Patch, Post, Query } from '@nestjs/common';
import { RecordService } from './record.service';
import { ApiBody, ApiOperation, ApiTags } from '@nestjs/swagger';
import { SaveFoodBatchDto, SaveFoodlogDto } from 'src/dto/record.save-foodlog.dto';
import { SaveHealthBatchDto, SaveHealthlogDto } from 'src/dto/record.save-healthlog.dto';
import { ApiResponse } from 'src/helpers/dto/api.response.dto';

@ApiTags('기록 관련 API')
@Controller('record')
export class RecordController {
  constructor(private readonly recordService: RecordService) { }
  
  // 타임라인 목록
  @Get('timeline')
  @ApiOperation({ summary: '타임라인 목록 조회 API', description: '사용자의 타임라인 목록을 조회합니다.' }) 
  async getTimeline(
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10
  ) {
    return await this.recordService.getTimeline(page, pageNum);
  }

  // 타임라인 날짜별 기록 조회
  @Get('timeline/date')
  @ApiOperation({ summary: '타임라인 날짜별 기록 조회 API', description: '사용자의 특정 날짜 타임라인 기록을 조회합니다.' })
  async getTimelineByDate(
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10,
    @Query('date') date: Date = new Date()
  ) {
    return this.recordService.getTimelineByDate(date, page, pageNum);
  }

  // 음식 ai 분석(AI로 음식이름 기준 칼로리 분석)
  @Get('food/analyze/:foodName')
  @ApiOperation({ summary: '음식 AI 분석 API', description: '사용자의 음식을 AI로 분석합니다.' })
  async analyzeFood(@Param('foodName') foodName: string): Promise<ApiResponse<any | null>> {
    return this.recordService.analyzeFood(foodName);
  }

  // 음식(식품)DB 검색
  @Get('food/search/foodname')
  @ApiOperation({ summary: '음식 검색 API', description: '사용자의 음식을 검색합니다.' })
  async searchFoodByName(
    @Query('page', ParseIntPipe) page: number = 0,
    @Query('pageNum', ParseIntPipe) pageNum: number = 10,
    @Query('foodName') foodName: string
  ) {
    return this.recordService.searchFoodByName(foodName, page, pageNum);
  }

  // 단위(unit)DB 검색
  @Get('food/search/unit')
  @ApiOperation({ summary: '단위 검색 API', description: '사용자의 단위를 검색합니다.' })
  async searchUnitByName() {
    return this.recordService.searchUnitByName();
  }

  // 음식 저장
  @Post('food')
  @ApiOperation({ summary: '음식 기록 저장 API', description: '사용자의 음식 기록을 저장합니다.' })
  @ApiBody({ type: SaveFoodBatchDto })
  async saveFoodRecord(@Body() data: SaveFoodBatchDto) {
    return this.recordService.saveFoodRecord(data.records);
  }

  // 음식 수정
  @Patch('food/update')
  @ApiOperation({ summary: '음식 기록 수정 API', description: '사용자의 음식 기록을 수정합니다.' })
  @ApiBody({ type: SaveFoodlogDto })
  async updateFoodRecord(@Body() data: SaveFoodlogDto) {
    return this.recordService.updateFoodRecord(data);
  }

  // 음식 삭제
  @Delete('food/delete/:sequence')
  @ApiOperation({ summary: '음식 기록 삭제 API', description: '사용자의 음식 기록을 삭제합니다.' })
  async deleteFoodRecord(@Param('sequence') sequence?: number) {
    return this.recordService.deleteFoodRecord(sequence);
  }

  // 건강 저장
  @Post('health')
  @ApiOperation({
    summary: '건강 기록 저장 API',
    description: '사용자의 건강 기록을 저장합니다.',
  })
  @ApiBody({ type: SaveHealthBatchDto })
  async saveHealthRecord(@Body() data: SaveHealthBatchDto) {
    return this.recordService.saveHealthRecord(data.records);
  } 

  // 건강 수정
  @Patch('health/update')
  @ApiOperation({
    summary: '건강 기록 수정 API',
    description: '사용자의 건강 기록을 수정합니다.',
  })
  @ApiBody({ type: SaveHealthlogDto })
  async updateHealthRecord(@Body() data: SaveHealthlogDto) {
    return this.recordService.updateHealthRecord(data);
  }

  // 건강 삭제
  @Delete('health/delete/:sequence')
  @ApiOperation({
    summary: '건강 기록 삭제 API',
    description: '사용자의 건강 기록을 삭제합니다.'
  })
  async deleteHealthRecord(@Param('sequence') sequence?: number) {
    return this.recordService.deleteHealthRecord(sequence);
  }
}
