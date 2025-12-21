import 'package:app/helpers/storages/auth_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';

part 'user_info.g.dart';

@Riverpod(keepAlive: true)
class UserInfo extends _$UserInfo {
  @override
  FutureOr<LoginResponse?> build() async {
    final storage = ref.read(authStorageProvider);

    final accessToken = await storage.read(AuthStorageKey.accessToken) ?? '';
    final refreshToken = await storage.read(AuthStorageKey.refreshToken) ?? '';
    final userId = await storage.read(AuthStorageKey.userId) ?? '';
    final username = await storage.read(AuthStorageKey.username) ?? '';
    final sequenceStr = await storage.read(AuthStorageKey.sequence) ?? '';
    final sequence = int.tryParse(sequenceStr);

    // 필수 정보가 하나라도 깨져있으면 로그아웃 처리
    if (userId.isEmpty ||
        username.isEmpty ||
        sequence == null ||
        accessToken.isEmpty ||
        refreshToken.isEmpty) {
      return null;
    }

    return LoginResponse(
      accessToken: accessToken,
      refreshToken: refreshToken,
      userId: userId,
      username: username,
      sequence: sequence,
    );
  }

  // ✅ 로그인 성공 시 호출 (외부에서 부름)
  Future<void> setInfo(LoginResponse? data) async {
    if (data == null) {
      state = const AsyncValue.data(null);
      return;
    }

    // 1. 스토리지에 영구 저장
    await ref.read(authStorageProvider).saveLoginData(data);

    // 2. Provider 상태 업데이트 (화면 갱신)
    state = AsyncValue.data(data);
  }

  // ✅ 로그아웃 시 호출
  Future<void> logout() async {
    // 1. 스토리지 삭제
    await ref.read(authStorageProvider).clearLoginData();

    // 2. 상태 비우기
    state = const AsyncValue.data(null);
  }
}
