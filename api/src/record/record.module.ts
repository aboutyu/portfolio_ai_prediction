import { Module } from '@nestjs/common';
import { RecordService } from './record.service';
import { Record } from './record';
import { RecordController } from './record.controller';
import { Type } from 'class-transformer';
import { TypeOrmModule } from '@nestjs/typeorm';
import { HealthLog } from 'src/entities/health-log.entity';
import { FoodLog } from 'src/entities/food-log.entity';
import { TimelineGroup } from 'src/entities/timeline-group.entity';
import { FoodNutritionInfo } from 'src/entities/food-nutrition-info.entity';
import { NutrientDictionary } from 'src/entities/nutrition-dictionary.entity';

@Module({
  imports: [TypeOrmModule.forFeature([HealthLog, FoodLog, TimelineGroup, FoodNutritionInfo, NutrientDictionary])],
  providers: [RecordService, Record],
  controllers: [RecordController]
})
export class RecordModule {}
