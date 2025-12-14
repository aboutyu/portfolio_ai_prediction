import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { database } from './configures/database';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';
import { MembershipModule } from './membership/membership.module';
import { User } from './entities/user.entity';
import { RecordModule } from './record/record.module';

@Module({
  imports: [database, MembershipModule, RecordModule,],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  constructor(private dataSource: DataSource) {}
}
