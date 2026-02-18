import 'package:app/helpers/models/app_update_model.dart';
import 'package:app/helpers/models/service_info_model.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';
import 'package:app/screen/auth/data/models/signup_response.model.dart';
import 'package:app/screen/auth/data/models/terms_model.dart';
import 'package:app/screen/chat/data/models/chat_message_model.dart';
import 'package:app/screen/daily/data/models/food_nutrition_model.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/home/data/models/timeline_date_model.dart';
import 'package:app/screen/notices/data/models/faq_category_model.dart';
import 'package:app/screen/notices/data/models/notice_model.dart';

enum ApiEndpoint {
  login(path: '/membership/login', method: 'POST'), // 로그인
  requestToken(path: '/membership/requestToken', method: 'POST'), // 자동로그인
  signup(path: '/membership/signup', method: 'POST'), // 회원가입
  logout(path: '/membership/logout', method: 'DELETE'), // 로그아웃
  leave(path: '/membership/leave', method: 'DELETE'), // 회원탈퇴
  termsList(path: '/membership/terms/list', method: 'GET'), // 약관목록 조회

  appUpdate(path: '/system/app-update', method: 'GET'), // 앱 업데이트 정보 조회
  serviceInfo(path: '/system/service-info', method: 'GET'), // 서비스 정보 조회

  timelineListDate(
    path: '/record/timeline/list/date',
    method: 'GET',
  ), // 타임라인 날짜 목록 조회
  timeline(path: '/record/timeline', method: 'GET'), // 타임라인 조회
  timelineDate(path: '/record/timeline/date', method: 'GET'), // 특정 날짜 타임라인 조회

  recordHealth(path: '/record/health', method: 'POST'), // 건강기록 생성
  recordHealthUpdate(path: '/record/health/update', method: 'PATCH'), // 건강기록 수정
  recordHealthDelete(
    path: '/record/health/delete',
    method: 'DELETE',
  ), // 건강기록 삭제
  recordFood(path: '/record/food', method: 'POST'), // 음식기록
  recordFoodUpdate(path: '/record/food/update', method: 'PATCH'), // 음식기록 수정
  recordFoodSearch(
    path: '/record/food/search/foodname',
    method: 'GET',
  ), // 음식기록 검색
  recordFoodAnalysis(
    path: '/record/food/analyze',
    method: 'GET',
    timeout: 300,
  ), // 음식기록 분석

  chatMessageHistory(path: '/chat/messages', method: 'GET'), // 채팅 기록 조회

  noticeList(path: '/notice/list', method: 'GET'), // 공지사항 목록 조회
  faqList(path: '/notice/faq/list', method: 'GET'), // FAQ 목록 조회
  faqCategoryList(path: '/notice/faq/types', method: 'GET') // FAQ 유형 목록 조회
  ;

  final String path;
  final String method;
  final int timeout;
  const ApiEndpoint({
    required this.path,
    required this.method,
    this.timeout = 60,
  });

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

      case ApiEndpoint.termsList:
        return <T>(json) {
          final wrapper = CoreResponse<List<TermsModel>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => TermsModel.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.appUpdate:
        return <T>(json) {
          final wrapper = CoreResponse<AppUpdateModel>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) =>
                AppUpdateModel.fromJson(dataJson as Map<String, dynamic>),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.serviceInfo:
        return <T>(json) {
          final wrapper = CoreResponse<ServiceInfoModel>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) =>
                ServiceInfoModel.fromJson(dataJson as Map<String, dynamic>),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.timelineListDate:
        return <T>(json) {
          final wrapper = CoreResponse<List<TimelineDate>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => TimelineDate.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

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

      case ApiEndpoint.recordFoodSearch:
        return <T>(json) {
          final wrapper = CoreResponse<List<FoodNutritionModel>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map(
                  (e) => FoodNutritionModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.recordFoodAnalysis:
        return <T>(json) {
          final wrapper = CoreResponse<List<FoodNutritionModel>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map(
                  (e) => FoodNutritionModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.chatMessageHistory:
        return <T>(json) {
          final wrapper = CoreResponse<List<ChatMessageModel>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map(
                  (e) => ChatMessageModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.noticeList:
        return <T>(json) {
          final wrapper = CoreResponse<List<NoticeModel>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => NoticeModel.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.faqList:
        return <T>(json) {
          final wrapper = CoreResponse<List<NoticeModel>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map((e) => NoticeModel.fromJson(e as Map<String, dynamic>))
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };

      case ApiEndpoint.faqCategoryList:
        return <T>(json) {
          final wrapper = CoreResponse<List<FaqCategoryModel>>.fromJson(
            json as Map<String, dynamic>,
            (dataJson) => (dataJson as List<dynamic>)
                .map(
                  (e) => FaqCategoryModel.fromJson(e as Map<String, dynamic>),
                )
                .toList(),
          );
          return wrapper as CoreResponse<T>;
        };
    }
  }
}
