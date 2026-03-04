import { Test, TestingModule } from '@nestjs/testing';
import { Record } from './record';

describe('Record', () => {
  let provider: Record;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [Record],
    }).compile();

    provider = module.get<Record>(Record);
  });

  it('should be defined', () => {
    expect(provider).toBeDefined();
  });
});
