import 'package:app/helpers/commons/common_funcs.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart'; // LoginResponse 모델 경로

part 'auth_storage.g.dart';

enum AuthStorageKey { accessToken, refreshToken, userId, username, sequence }

extension AuthStorageKeyExtension on AuthStorageKey {
  String get string {
    switch (this) {
      case AuthStorageKey.accessToken:
        return 'accessToken';
      case AuthStorageKey.refreshToken:
        return 'refreshToken';
      case AuthStorageKey.userId:
        return 'userId';
      case AuthStorageKey.username:
        return 'username';
      case AuthStorageKey.sequence:
        return 'sequence';
    }
  }
}

@Riverpod(keepAlive: true)
AuthStorage authStorage(Ref ref) => AuthStorage();

class AuthStorage {
  final _storage = const FlutterSecureStorage();

  // 로그인 성공 시 모든 정보 저장
  Future<void> saveLoginData(LoginResponse data) async {
    await Future.wait([
      _storage.write(
        key: AuthStorageKey.accessToken.string,
        value: data.accessToken,
      ),
      _storage.write(
        key: AuthStorageKey.refreshToken.string,
        value: data.refreshToken,
      ),
      _storage.write(key: AuthStorageKey.userId.string, value: data.userId),
      _storage.write(key: AuthStorageKey.username.string, value: data.username),
      _storage.write(
        key: AuthStorageKey.sequence.string,
        value: data.sequence.toString(),
      ), // int -> String 변환
    ]);

    debugMessage([
      '로그인 데이터 저장 완료',
      'sequence: ${await _storage.read(key: AuthStorageKey.sequence.string)}',
      'userId: ${await _storage.read(key: AuthStorageKey.userId.string)}',
      'username: ${await _storage.read(key: AuthStorageKey.username.string)}',
      'accessToken: ${await _storage.read(key: AuthStorageKey.accessToken.string)}',
      'refreshToken: ${await _storage.read(key: AuthStorageKey.refreshToken.string)}',
    ]);
  }

  // 로그아웃 시 삭제
  Future<void> clearLoginData() async {
    await _storage.deleteAll();
  }

  Future<String?> read(AuthStorageKey key) async {
    return await _storage.read(key: key.string);
  }
}
