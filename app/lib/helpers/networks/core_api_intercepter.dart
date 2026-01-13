import 'dart:io';
import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/helpers/routers/router.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CoreApiIntercepter extends Interceptor {
  final Ref ref;
  final FlutterSecureStorage storage;
  BuildContext? get context => rootNavigatorKey.currentContext;

  CoreApiIntercepter(this.ref, this.storage);

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
      options.headers['x-platform'] = deviceType;
    } catch (e) {
      debugMessage(['기기 정보 헤더 설정 실패', e]);
    }

    final accessToken = await storage.read(key: 'accessToken');
    final refreshToken = await storage.read(key: 'refreshToken');

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    if (refreshToken != null) {
      options.headers['x-refreshToken'] = refreshToken;
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugMessage([
      'API 요청 에러: ${err.requestOptions.path}',
      'Method: ${err.requestOptions.method}',
      'Send Timeout: ${err.requestOptions.sendTimeout} seconds',
      'Receive Timeout: ${err.requestOptions.receiveTimeout} seconds',
      'Request Headers: ${err.requestOptions.headers}',
      'Response Headers: ${err.response?.headers}',
      'Parameters: ${err.requestOptions.queryParameters}',
      'Body Data: ${err.requestOptions.data}',
      'Status Code: ${err.response?.statusCode}',
      'Error Message: ${err.message}',
    ]);

    if (err.response?.statusCode == 401 && context != null) {
      final ctx = context!;
      final tr = ctx.tr;
      SingleDialogWidget(
        content: tr.expiredLoginTokenText,
        title: tr.expiredLoginTokenTitleText,
        onConfirm: () => ref.read(userInfoProvider.notifier).logout(),
      ).show(ctx);
    }
    super.onError(err, handler);
  }
}
