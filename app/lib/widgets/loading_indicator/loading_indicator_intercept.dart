// loading_interceptor.dart
import 'package:app/widgets/loading_indicator/loading_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingIndicatorIntercept extends Interceptor {
  final Ref ref;
  final Duration _minDuration = const Duration(milliseconds: 500); // 최소 표시 시간

  LoadingIndicatorIntercept(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // API 요청 시작 -> 로딩 켜기
    ref.read(loadingProviderProvider.notifier).start();
    options.extra['startTime'] = DateTime.now();
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    // 응답 성공 -> 로딩 끄기
    await _delayAndFinish(response.requestOptions);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // 에러 발생 -> 로딩 끄기
    await _delayAndFinish(err.requestOptions);
    super.onError(err, handler);
  }

  /// 최소 시간 대기 후 로딩 끄기
  Future<void> _delayAndFinish(RequestOptions options) async {
    final startTime = options.extra['startTime'] as DateTime?;

    if (startTime != null) {
      final elapsed = DateTime.now().difference(startTime);

      // 최소 시간보다 빨리 끝났으면, 남은 시간만큼 대기
      if (elapsed < _minDuration) {
        await Future.delayed(_minDuration - elapsed);
      }
    }

    ref.read(loadingProviderProvider.notifier).finish();
  }
}
