import { Module } from '@nestjs/common';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from 'src/entities/user.entity';
import { UserDevice } from 'src/entities/user-devices.entity';
import { FoodLog } from 'src/entities/food-log.entity';
import { HealthLog } from 'src/entities/health-log.entity';
import { TimelineGroup } from 'src/entities/timeline-group.entity';
import { AdminUser } from 'src/entities/admin-user.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      User,
      UserDevice,
      FoodLog,
      HealthLog,
      TimelineGroup,
      AdminUser,
    ]),
  ],
  controllers: [UsersController],
  providers: [UsersService],
})
export class UsersModule {}
