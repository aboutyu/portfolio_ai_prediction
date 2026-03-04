import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/configures/app_config.dart';
import 'package:app/helpers/dto/base_request.dto.dart';
import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/core_api_intercepter.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/widgets/loading_indicator/loading_indicator_intercept.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_api_provider.g.dart';

class CoreApiProvider {
  final Dio _dio;
  CoreApiProvider(this._dio);

  Future<CoreResponse<T>> request<T>({
    required ApiEndpoint endpoint,
    BaseRequestDto? dto,
    Map<String, dynamic>? parameters,
  }) async {
    try {
      final bodyData = endpoint.method != 'GET' && dto != null
          ? dto.toJson()
          : null;
      final queryParameters =
          (endpoint.method == 'GET' || endpoint.method == 'DELETE')
          ? (dto?.toJson() ?? parameters)
          : null;
      final options = Options(
        method: endpoint.method,
        receiveTimeout: Duration(seconds: endpoint.timeout),
        sendTimeout: Duration(seconds: endpoint.timeout),
      );

      final response = await _dio.request(
        endpoint.path,
        data: bodyData,
        queryParameters: queryParameters,
        options: options,
      );

      final result = endpoint.decoder<T>(response.data);

      debugMessage([
        'API 요청 완료: ${response.requestOptions.uri}',
        'Method: ${endpoint.method}',
        'Timeout: ${endpoint.timeout} seconds',
        'Request(dto): ${dto?.toJson()}',
        'Request Headers: ${response.requestOptions.headers}',
        'Response Headers: ${response.headers}',
        'Body Data: $bodyData',
        'Status Code: ${response.statusCode}',
        'Response(data): ${response.data}',
        'Decoded Result: $result',
      ]);

      return result;
    } catch (e) {
      debugMessage(['API 요청 중 에러 발생(request)', e.toString()]);
      throw Exception(e);
    }
  }
}

@Riverpod(keepAlive: true)
CoreApiProvider coreApiProvider(Ref ref) {
  final storage = FlutterSecureStorage();

  final dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.host,
      connectTimeout: const Duration(seconds: 120),
      receiveTimeout: const Duration(seconds: 120),
    ),
  );

  dio.interceptors.add(CoreApiIntercepter(ref, storage)); // 공통 인터셉터 추가
  dio.interceptors.add(LoadingIndicatorIntercept(ref)); // 로딩 인디케이터 인터셉터 추가

  // // 개발(디버그모드) 중에만 로그 찍기
  // if (isDebug) {
  //   dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  // }
  return CoreApiProvider(dio);
}
