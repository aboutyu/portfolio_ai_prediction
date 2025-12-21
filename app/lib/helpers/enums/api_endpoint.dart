import 'package:app/helpers/enums/status_code.enum.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';

enum ApiEndpoint {
  login(path: '/membership/login', method: 'POST'), // 로그인
  requestToken(path: '/membership/requestToken', method: 'POST'), // 자동로그인
  logout(path: '/membership/logout', method: 'DELETE'), // 로그아웃
  signup(path: '/membership/signup', method: 'POST'), // 회원가입
  leave(path: '/membership/leave', method: 'DELETE'); // 회원탈퇴

  final String path;
  final String method;
  const ApiEndpoint({required this.path, required this.method});

  CoreResponse<T> Function<T>(dynamic data) get decoder {
    switch (this) {
      case ApiEndpoint.login:
        return <T>(json) {
          final wrapper = CoreResponse<LoginResponse>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) =>
                LoginResponse.fromJson(dataJson as Map<String, dynamic>),
          );

          if (wrapper.status != StatusCode.success) {
            throw Exception('API Error: ${wrapper.code}');
          }

          return wrapper as CoreResponse<T>;
        };
      case ApiEndpoint.requestToken:
        return <T>(data) => LoginResponse.fromJson(data) as CoreResponse<T>;
      case ApiEndpoint.logout:
        return <T>(data) => LoginResponse.fromJson(data) as CoreResponse<T>;
      case ApiEndpoint.signup:
        return <T>(data) => LoginResponse.fromJson(data) as CoreResponse<T>;
      case ApiEndpoint.leave:
        return <T>(data) => LoginResponse.fromJson(data) as CoreResponse<T>;
    }
  }
}
