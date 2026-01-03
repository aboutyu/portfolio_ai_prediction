import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/networks/enums/response_code.enum.dart';
import 'package:app/helpers/networks/enums/status_code.enum.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';
import 'package:app/screen/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@riverpod
class LoginViewModel extends _$LoginViewModel {
  @override
  Future<void> build() async {
    return;
  }

  Future<CoreResponse<LoginResponse>> login(
    String userId,
    String password,
  ) async {
    final userNotifier = ref.read(userInfoProvider.notifier);
    final repository = ref.read(authRepositoryProvider);
    final response = await repository.login(userId, password);

    if (response.data == null) {
      throw Exception('로그인 데이터가 없습니다.');
    }

    userNotifier.setInfo(response.data);
    return response;
  }

  Future<CoreResponse<LoginResponse>> autoLogin() async {
    final repository = ref.read(authRepositoryProvider);
    final response = await repository.autoLogin();

    if (response.data == null) {
      throw Exception('자동 로그인 데이터가 없습니다.');
    }

    await ref.read(userInfoProvider.notifier).setInfo(response.data);
    return response;
  }

  Future<CoreResponse<LoginResponse>?> signup(
    String userId,
    String password,
    String username,
  ) async {
    final repository = ref.read(authRepositoryProvider);
    final userRepository = ref.read(userInfoProvider.notifier);
    final response = await repository.signup(userId, password, username);

    if (response.status == StatusCode.failed) {
      debugMessage('회원가입 실패: (${response.code}) ${response.code?.message}');
      return null;
    }

    final loginResponse = await repository.login(userId, password);
    await userRepository.setInfo(loginResponse.data);
    return loginResponse;
  }
}
