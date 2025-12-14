import { ApiProperty } from "@nestjs/swagger";
import { Type } from "class-transformer";
import { ValidateNested, IsArray } from "class-validator";

export class SaveFoodlogDto {
  @ApiProperty({
    description: '음식 시퀀스',
    default: 1,
    required: false,
  })
  sequence?: number;

  @ApiProperty({
    description: '그룹 UUID',
    default: '550e8400-e29b-41d4-a716-446655440000',
    required: false,
  })
  groupUuid?: string;

  @ApiProperty({
    description: '음식이름',
    default: '샐러드',
    required: true,
  })
  foodName: string;

  @ApiProperty({
    description: '기록값',
    default: 1.0,
    required: true,
  })
  calories: number;

  @ApiProperty({
    description: '측정시간',
    default: '2024-06-01T12:00:00Z',
    required: true,
  })
  recordDate: Date;
}

export class SaveFoodBatchDto {
  @ApiProperty({
    description: '음식 기록 리스트',
    type: SaveFoodlogDto,
    isArray: true,
  })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => SaveFoodlogDto)
  records: SaveFoodlogDto[];
}