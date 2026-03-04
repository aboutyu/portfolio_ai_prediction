import { Test, TestingModule } from '@nestjs/testing';
import { MembershipService } from './membership.service';

describe('Membership', () => {
  let provider: MembershipService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [MembershipService],
    }).compile();

    provider = module.get<MembershipService>(MembershipService);
  });

  it('should be defined', () => {
    expect(provider).toBeDefined();
  });
});
