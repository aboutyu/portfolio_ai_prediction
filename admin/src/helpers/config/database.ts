import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';

export const database = TypeOrmModule.forRootAsync({
  imports: [ConfigModule],
  inject: [ConfigService],
  useFactory: (configService: ConfigService) => {
    // 👇 1. 변수값 먼저 가져오기
    const host = configService.get<string>('DB_HOST');
    const port = configService.get<number>('DB_PORT');
    const username = configService.get<string>('DB_USERNAME');
    const dbName = configService.get<string>('DB_DATABASE');
    const logging = configService.get<string>('DB_LOGGING') === 'true';

    // 👇 2. 콘솔에 출력 (비밀번호는 보안상 길이만 출력하거나 숨김)
    if (process.env.NODE_ENV !== 'production') {
      console.log('====================================');
      console.log('🚨 [DB 접속 시도 설정값 확인] 🚨');
      console.log(`1. HOST (주소): ${host}`);
      console.log(`2. PORT (포트): ${port}`);
      console.log(`3. USER (계정): ${username}`);
      console.log(`4. DB   (이름): ${dbName}`);
      console.log(`5. LOGGING (로그출력): ${logging} 타입: ${typeof logging}`);
      console.log('====================================');
    }

    return {
      type: 'mysql',
      host: host,
      port: port,
      username: username,
      password: configService.get<string>('DB_PASSWORD'),
      database: dbName,
      timezone: 'Z',
      autoLoadEntities: true,
      entities: [__dirname + '/../../**/*.entity{.ts,.js}'],
      synchronize: false,
      logging: logging,
    };
  },
});
