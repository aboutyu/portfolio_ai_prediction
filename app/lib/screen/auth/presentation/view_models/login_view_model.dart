import 'package:app/helpers/enums/status_code.enum.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/helpers/storages/auth_storage.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';
import 'package:app/screen/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@Riverpod(keepAlive: true)
class LoginViewModel extends _$LoginViewModel {
  @override
  Future<void> build() async {
    return;
  }

  Future<CoreResponse<LoginResponse>> login(
    String userId,
    String password,
  ) async {
    state = const AsyncValue.loading(); // 로딩 시작

    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.login(userId, password);

      if (response.data == null) {
        throw Exception('로그인 데이터가 없습니다.');
      }

      await authStorage(ref).saveLoginData(response.data!);
      state = const AsyncValue.data(null); // 로딩 완료
      return response;
    } catch (e, st) {
      state = AsyncValue.error(e, st); // 오류 상태로 설정
      rethrow;
    }
  }

  Future<CoreResponse<LoginResponse>> autoLogin() async {
    state = const AsyncValue.loading(); // 로딩 시작

    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.autoLogin();

      if (response.data == null) {
        throw Exception('자동 로그인 데이터가 없습니다.');
      }

      await authStorage(ref).saveLoginData(response.data!);
      state = const AsyncValue.data(null); // 로딩 완료
      return response;
    } catch (e, st) {
      state = AsyncValue.error(e, st); // 오류 상태로 설정
      rethrow;
    }
  }

  Future<CoreResponse<LoginResponse>> signup(
    String userId,
    String password,
    String username,
  ) async {
    state = const AsyncValue.loading(); // 로딩 시작

    try {
      final repository = ref.read(authRepositoryProvider);
      final response = await repository.signup(userId, password, username);

      if (response.status != StatusCode.success || response.data == null) {
        throw Exception('회원가입 데이터가 없습니다.');
      }

      final loginResponse = await repository.login(userId, password);

      await authStorage(ref).saveLoginData(loginResponse.data!);
      state = const AsyncValue.data(null); // 로딩 완료
      return response;
    } catch (e, st) {
      state = AsyncValue.error(e, st); // 오류 상태로 설정
      rethrow;
    }
  }
}
