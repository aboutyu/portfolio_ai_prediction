import { ServiceCodeType } from 'src/types/service-code.type';

export class ServiceCodeDto {
  code: string;
  type: ServiceCodeType;
  name: string;
  language: string;

  sequence?: number;
  isActivate?: string;
  memo?: string;
}
