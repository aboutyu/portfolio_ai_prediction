import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/enums/response_code.enum.dart';
import 'package:app/helpers/enums/status_code.enum.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/helpers/storages/auth_storage.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';
import 'package:app/screen/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

// @Riverpod(keepAlive: true)
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
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.login(userId, password);

      if (response.data == null) {
        throw Exception('로그인 데이터가 없습니다.');
      }

      await ref.read(userInfoProvider.notifier).setInfo(response.data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<CoreResponse<LoginResponse>> autoLogin() async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.autoLogin();

      if (response.data == null) {
        throw Exception('자동 로그인 데이터가 없습니다.');
      }

      await ref.read(userInfoProvider.notifier).setInfo(response.data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<CoreResponse<LoginResponse>?> signup(
    String userId,
    String password,
    String username,
  ) async {
    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.signup(userId, password, username);

      if (response.status == StatusCode.failed) {
        debugMessage('회원가입 실패: (${response.code}) ${response.code?.message}');
        return null;
      }

      final loginResponse = await repository.login(userId, password);
      await ref.read(userInfoProvider.notifier).setInfo(loginResponse.data);
      return loginResponse;
    } catch (e) {
      rethrow;
    }
  }
}
