import { TypeOrmModule } from '@nestjs/typeorm';

export const database = TypeOrmModule.forRoot({
  type: 'mysql',
  host: 'joyjoy98.iptime.org',
  port: 3306,
  username: 'yutaehun',
  password: 'qweasd123',
  database: 'portfolio_ai_prediction_dev',
  charset: 'utf8',
  timezone: 'Z',
  entities: [__dirname + '/../entities/*.entity{.js,.ts}'],
  synchronize: false,
  logging: true,
});
