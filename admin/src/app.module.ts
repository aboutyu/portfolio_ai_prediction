import { MiddlewareConsumer, Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { GlobalMiddleware } from './common/middlewares/global.middleware';
import { database } from './configures/database';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Sessions } from './entities/session.entity';
import { FoodNutritionInfo } from './entities/food-nutrition-info.entity';

@Module({
  imports: [database, TypeOrmModule.forFeature([Sessions, FoodNutritionInfo])],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(GlobalMiddleware).forRoutes('*'); // 모든 요청에서 실행
  }
}
