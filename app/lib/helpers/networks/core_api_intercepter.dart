import 'dart:io';

import 'package:app/helpers/commons/common_funcs.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CoreApiIntercepter extends Interceptor {
  final FlutterSecureStorage storage;

  CoreApiIntercepter(this.storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // 공통 헤더 설정
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    });

    // [기기 정보 헤더] 언어, 타임존, OS 등
    try {
      options.headers['Accept-Language'] = Platform.localeName;
      options.headers['x-timezone'] = DateTime.now().timeZoneName;
      options.headers['x-platform'] = Platform.isAndroid ? 'android' : 'ios';
    } catch (e) {
      debugMessage('기기 정보 헤더 설정 실패: $e');
    }

    final accessToken = await storage.read(key: 'accessToken');
    final refreshToken = await storage.read(key: 'refreshToken');

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    if (refreshToken != null) {
      options.headers['x-refresh-token'] = refreshToken;
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // 에러 처리 로직 추가 가능
    super.onError(err, handler);
  }
}
