import { Test, TestingModule } from '@nestjs/testing';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { service } from './common/utils/constants';

describe('AppController', () => {
  let appController: AppController;
  let appService: AppService;

  beforeEach(async () => {
    const app: TestingModule = await Test.createTestingModule({
      controllers: [AppController],
      providers: [
        {
          provide: AppService,
          useValue: {
            loginIndex: jest.fn(),
          }
        }
      ],
    }).compile();

    appController = app.get<AppController>(AppController);
    appService = app.get<AppService>(AppService);
  });

  describe('loginIndex', () => {
    it('should return the result from appService.loginIndex()', async () => {
      // 2. 테스트를 위한 가상의 결과값 정의
      const fakeData = {
        name: 'AI 예측 서비스 관리자(가짜)',
        description: 'AI 예측 서비스 관리자 페이지입니다.',
        version: '1.0.0',
        author: '유태훈',
      };

      // 3. appService.loginIndex가 호출되면 위 결과값을 리턴하도록 조작(Spy)
      jest.spyOn(appService, 'loginIndex').mockResolvedValue(service);

      // 4. 실제 컨트롤러 함수 호출 (await 필수)
      const result = await appController.loginIndex();

      // 5. 검증: 서비스가 준 데이터와 컨트롤러가 반환한 데이터가 같은지 확인
      expect(result).toEqual(fakeData);
      
      // (선택) 서비스 함수가 실제로 1번 호출되었는지 검증
      expect(appService.loginIndex).toHaveBeenCalledTimes(1);
    });
  });
});
