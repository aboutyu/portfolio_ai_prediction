import session from 'express-session';
import { TypeormStore } from 'connect-typeorm';
import { Sessions } from '../entities/session.entity';
import { DataSource } from 'typeorm';

export function sessionConfig(dataSource: DataSource) {
  const sessionRepository = dataSource.getRepository(Sessions);
  const typeormStore = new TypeormStore({
    cleanupLimit: 2,
    limitSubquery: false,
  });

  return session({
    secret: 'your_secret_key', // 보안을 위해 .env 파일로 관리하세요.
    resave: false,
    saveUninitialized: false,
    store: typeormStore.connect(sessionRepository),
    cookie: {
      secure: false,
      httpOnly: true,
      maxAge: 1000 * 60 * 60,
    }, // 1시간 유지
  });
}
