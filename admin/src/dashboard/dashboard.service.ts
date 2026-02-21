import { Injectable } from '@nestjs/common';

@Injectable()
export class DashboardService {
  async dashboard() {
    return { message: 'Welcome to the Dashboard!' };
  }
}
