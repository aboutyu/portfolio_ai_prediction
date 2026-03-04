import { Module } from '@nestjs/common';
import { SystemService } from './system.service';
import { SystemController } from './system.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ServiceInfo } from 'src/entities/service-info.entity';
import { Terms } from 'src/entities/terms.entity';
import { UserDevice } from 'src/entities/user-devices.entity';
import { NutrientDictionary } from 'src/entities/nutrition-dictionary.entity';
import { FoodNutritionInfo } from 'src/entities/food-nutrition-info.entity';
import { ServiceCode } from 'src/entities/service-code.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      Terms,
      ServiceInfo,
      NutrientDictionary,
      UserDevice,
      FoodNutritionInfo,
      ServiceCode,
    ]),
  ],
  providers: [SystemService],
  controllers: [SystemController],
})
export class SystemModule {}
