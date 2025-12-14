import { ApiProperty } from "@nestjs/swagger";
import { Transform } from "class-transformer";
import { IsNumber } from "class-validator";

export class PageResponseDto {
  @ApiProperty({
    description: '요청받은 페이지(전달받은 값 그대로 응답)',
    default: 0,
    required: true,
  })
  @Transform(({ value }) => value ?? 0) 
  @IsNumber()
  page: number;

  @ApiProperty({
    description: '전체 페이지 수',
    default: 0,
    required: true,
  })
  @Transform(({ value }) => value ?? 0) 
  @IsNumber()
  totalCount: number;

  @ApiProperty({
    description: '현재 페이지 수',
    default: 0,
    required: true,
  })
  @Transform(({ value }) => value ?? 0) 
  @IsNumber()
  pageCount: number;

  @ApiProperty({
    description: '한 페이지당 데이터 수(전달받은 값 그대로 응답)',
    default: 10,
    required: true,
  })
  @Transform(({ value }) => value ?? 10) 
  @IsNumber()
  pageNum: number;
 }