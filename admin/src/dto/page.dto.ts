import { Type } from 'class-transformer';
import { IsInt, IsOptional, Min } from 'class-validator';
import { pageSize } from 'src/helpers/constants';

export class PageDto {
  @Type(() => Number) // 문자열을 숫자로 변환
  @IsInt()
  @Min(0)
  @IsOptional()
  page: number = 0;

  @Type(() => Number)
  @IsOptional()
  @IsInt()
  sequence?: number;

  // page * pageNo 계산
  get skip(): number {
    return this.page * pageSize;
  }
}
