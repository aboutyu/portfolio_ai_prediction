import { Test, TestingModule } from '@nestjs/testing';
import { CsController } from './cs.controller';

describe('CsController', () => {
  let controller: CsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [CsController],
    }).compile();

    controller = module.get<CsController>(CsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
