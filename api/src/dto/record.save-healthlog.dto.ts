import { ApiProperty } from "@nestjs/swagger";
import { Type } from "class-transformer";
import { IsEnum, IsNotEmpty, ValidateNested, IsArray } from "class-validator";
import { DeviceType } from "src/helpers/enums/device-type.enum";
import { HealthType } from "src/helpers/enums/health-type.enum";

export class SaveHealthlogDto {
  @ApiProperty({
    description: '건강 시퀀스',
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
    description: '건강기록타입',
    enum: HealthType,
    example: HealthType.STEP_COUNT,
    required: true,
  })
  @IsEnum(HealthType, { message: 'healthType은 SCT, BPT, BGT 중 하나여야 합니다.' })
  @IsNotEmpty()
  healthType: HealthType;

  @ApiProperty({
    description: '기록값',
    default: 1.0,
    required: true,
  })
  healthValue: number;

  @ApiProperty({
    description: '추가 기록값',
    default: 1.0,
    required: true,
  })
  healthExtraValue: number;

  @ApiProperty({
    description: '데이터 출처 (디바이스 타입)',
    enum: DeviceType,
    example: DeviceType.IOS,
    required: true,
  })
  @IsEnum(DeviceType, { message: 'deviceType은 IOS 또는 AOS여야 합니다.' }) // 👈 유효성 검사
  @IsNotEmpty()
  deviceType: DeviceType;

  @ApiProperty({
    description: '측정시간',
    default: '2024-06-01T12:00:00Z',
    required: true,
  })
  recordDate: Date;
}

export class SaveHealthBatchDto {
  @ApiProperty({
    description: '건강 기록 리스트',
    type: SaveHealthlogDto,
    isArray: true,
  })
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => SaveHealthlogDto)
  records: SaveHealthlogDto[];
}
