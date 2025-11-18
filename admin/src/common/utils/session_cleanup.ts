import { DataSource } from 'typeorm';
import { Sessions } from '../../entities/session.entity';

export async function cleanupExpiredSessions(dataSource: DataSource) {
  await dataSource
    .createQueryBuilder()
    .delete()
    .from(Sessions)
    .where('expiredAt <= :now', { now: Date.now() })
    .execute();
}
