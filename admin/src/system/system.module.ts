import { Module } from '@nestjs/common';
import { SystemService } from './system.service';
import { SystemController } from './system.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ServiceInfo } from 'src/entities/service-info.entity';
import { Terms } from 'src/entities/terms.entity';
import { UserDevice } from 'src/entities/user-devices.entity';
import { NutrientDictionary } from 'src/entities/nutrition-dictionary.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      Terms,
      ServiceInfo,
      NutrientDictionary,
      UserDevice,
    ]),
  ],
  providers: [SystemService],
  controllers: [SystemController],
})
export class SystemModule {}
