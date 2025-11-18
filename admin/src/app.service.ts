import { Injectable } from '@nestjs/common';
import { service } from './common/utils/constants';

@Injectable()
export class AppService {
  async loginIndex() {
    return {
      name: service.name,
      description: service.description,
      version: service.version,
      author: service.author,
    };
  }
}
