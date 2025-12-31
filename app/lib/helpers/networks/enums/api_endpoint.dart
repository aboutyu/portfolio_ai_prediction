import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';
import 'package:app/screen/auth/data/models/signup_response.model.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';

enum ApiEndpoint {
  login(path: '/membership/login', method: 'POST'), // 로그인
  requestToken(path: '/membership/requestToken', method: 'POST'), // 자동로그인
  signup(path: '/membership/signup', method: 'POST'), // 회원가입
  logout(path: '/membership/logout', method: 'DELETE'), // 로그아웃
  leave(path: '/membership/leave', method: 'DELETE'), // 회원탈퇴

  timeline(path: '/record/timeline', method: 'GET'), // 타임라인 조회
  timelineDate(path: '/record/timeline/date', method: 'GET'), // 특정 날짜 타임라인 조회

  recordHealth(path: '/record/health', method: 'POST'), // 건강기록 생성
  recordHealthUpdate(path: '/record/health/update', method: 'PATCH'), // 건강기록 수정
  recordHealthDelete(
    path: '/record/health/delete',
    method: 'DELETE',
  ), // 건강기록 삭제
  recordFood(path: '/record/food', method: 'POST'), // 음식기록
  recordFoodUpdate(path: '/record/food/update', method: 'PATCH') // 음식기록 수정
  ;

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
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.requestToken:
        return <T>(json) {
          final wrapper = CoreResponse<LoginResponse>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) =>
                LoginResponse.fromJson(dataJson as Map<String, dynamic>),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.signup:
        return <T>(json) {
          final wrapper = CoreResponse<SignupResponse>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) =>
                SignupResponse.fromJson(dataJson as Map<String, dynamic>),
          );
          return wrapper as CoreResponse<T>;
        };
      case ApiEndpoint.leave:
        return <T>(data) => LoginResponse.fromJson(data) as CoreResponse<T>;
      case ApiEndpoint.logout:
        return <T>(data) => LoginResponse.fromJson(data) as CoreResponse<T>;

      case ApiEndpoint.timeline:
        return <T>(json) {
          final wrapper = CoreResponse<List<TimelineItem>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => TimelineItem.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };
      case ApiEndpoint.timelineDate:
        return <T>(json) {
          final wrapper = CoreResponse<List<TimelineItem>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => TimelineItem.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.recordHealth:
        return <T>(json) {
          final wrapper = CoreResponse<List<HealthLog>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => HealthLog.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.recordHealthUpdate:
        return <T>(json) {
          final wrapper = CoreResponse<List<HealthLog>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => HealthLog.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.recordHealthDelete:
        return <T>(json) {
          final wrapper = CoreResponse<HealthLog>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => HealthLog.fromJson(dataJson as Map<String, dynamic>),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.recordFood:
        return <T>(json) {
          final wrapper = CoreResponse<List<FoodLog>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => FoodLog.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.recordFoodUpdate:
        return <T>(json) {
          final wrapper = CoreResponse<List<FoodLog>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => FoodLog.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };
    }
  }
}
