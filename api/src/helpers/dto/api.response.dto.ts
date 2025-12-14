import { ApiProperty } from '@nestjs/swagger';
import { ErrorCode, FailureCode, StatusCode } from '../enums/status.enum';
import { IsOptional } from 'class-validator';
import { PageResponseDto } from './page.response.dto';

export class ApiResponse<T> {
  @ApiProperty({
    description: '응답 상태',
    enum: StatusCode,
    default: StatusCode.SUCCESS,
    required: true,
  })
  status: StatusCode;

  @ApiProperty({
    description: '에러, 실패 응답코드(메시지는 다국어로 FE/Mobile에서 처리)',
    default: null,
    nullable: true,
    required: false,
    oneOf: [
      { type: 'string', enum: Object.values(ErrorCode), title: 'ErrorCode' },
      { type: 'string', enum: Object.values(FailureCode), title: 'FailureCode' },
    ],
  })
  @IsOptional()
  code?: ErrorCode | FailureCode;

  @ApiProperty({
    description: '전달받은 페이징 정보',
    default: null,
    nullable: true,
    required: false,
  })
  @IsOptional()
  pageInfo?: PageResponseDto;

  @ApiProperty({
    description: '응답 데이터',
    default: null,
    nullable: true,
    required: false,
  })
  @IsOptional()
  data?: T;
}
