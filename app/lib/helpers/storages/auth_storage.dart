import 'package:app/helpers/commons/common_funcs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart'; // LoginResponse 모델 경로

part 'auth_storage.g.dart';

// 키 값 상수 정의 (오타 방지)
const _kAccessToken = 'accessToken';
const _kRefreshToken = 'refreshToken';
const _kUserId = 'userId';
const _kUsername = 'username';
const _kSequence = 'sequence';

@Riverpod(keepAlive: true)
AuthStorage authStorage(Ref ref) => AuthStorage();

class AuthStorage {
  final _storage = const FlutterSecureStorage();

  // 로그인 성공 시 모든 정보 저장
  Future<void> saveLoginData(LoginResponse data) async {
    await Future.wait([
      _storage.write(key: _kAccessToken, value: data.accessToken),
      _storage.write(key: _kRefreshToken, value: data.refreshToken),
      _storage.write(key: _kUserId, value: data.userId),
      _storage.write(key: _kUsername, value: data.username),
      _storage.write(
        key: _kSequence,
        value: data.sequence.toString(),
      ), // int -> String 변환
    ]);

    debugMessage([
      '로그인 데이터 저장 완료',
      'sequence: ${await _storage.read(key: _kSequence)}',
      'userId: ${await _storage.read(key: _kUserId)}',
      'username: ${await _storage.read(key: _kUsername)}',
      'accessToken: ${await _storage.read(key: _kAccessToken)}',
      'refreshToken: ${await _storage.read(key: _kRefreshToken)}',
    ]);
  }

  // 로그아웃 시 삭제
  Future<void> clearLoginData() async {
    await _storage.deleteAll();
  }
}
