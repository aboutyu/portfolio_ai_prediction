import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/cores/repositories/app_initializer_repository.dart';
import 'package:app/helpers/networks/enums/status_code.enum.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_initializer.g.dart';

@riverpod
class AppInitialization extends _$AppInitialization {
  @override
  Future<void> build() async {
    await _initialize();
  }

  Future<void> _initialize() async {
    await _setupServiceCodes();
    await _fetchServiceInfo();

    // 초기화 상태 출력
    AppConfig.debugMessage();
  }

  Future<void> _fetchServiceInfo() async {
    final repository = ref.read(appInitializerRepositoryProvider);
    final response = await repository.fetchServiceInfo();
    debugMessage([
      '서비스 정보 API 응답',
      'Status Code: ${response.status}',
      'Response Data: ${response.data}',
    ]);

    if (response.data == null) {
      throw Exception('서비스 정보 데이터가 없습니다.');
    }

    if (response.status == StatusCode.success && response.data != null) {
      debugMessage('서비스 정보 로드 성공: ${response.data}');
      AppConfig.setServiceInfo(response.data!);
    } else {
      debugMessage('서비스 정보 로드 실패: API 응답 상태 ${response.status}');
    }
  }

  Future<void> _setupServiceCodes() async {
    final repository = ref.read(appInitializerRepositoryProvider);
    final response = await repository.fetchServiceCodes();
    debugMessage([
      '서비스 코드 API 응답',
      'Status Code: ${response.status}',
      'Response Data: ${response.data}',
    ]);

    if (response.data == null) {
      throw Exception('서비스 코드 데이터가 없습니다.');
    }

    if (response.status == StatusCode.success && response.data != null) {
      debugMessage('서비스 코드 로드 성공: ${response.data}');
      AppConfig.setServiceCode(response.data!);
    } else {
      debugMessage('서비스 코드 로드 실패: API 응답 상태 ${response.status}');
    }
  }
}
