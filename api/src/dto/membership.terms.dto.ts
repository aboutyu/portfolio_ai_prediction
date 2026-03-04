import { ApiProperty } from '@nestjs/swagger';
import { TermsType } from 'src/helpers/enums/terms-type.enum';

export class TermsDto {
  @ApiProperty({
    description: 'sequence',
    required: false,
  })
  sequence?: number | null;

  @ApiProperty({
    description: '약관종류',
    default: 'service',
    required: true,
  })
  type: TermsType;
}
