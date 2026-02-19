import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/cores/admob_config.dart';
import 'package:app/helpers/enums/app_environment.enum.dart';
import 'package:app/helpers/enums/platform.enum.dart';
import 'package:app/helpers/models/service_code_model.dart';
import 'package:app/helpers/models/service_info_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  const AppConfig._();

  static late AppEnvironment _env;
  static void setEnvironment(AppEnvironment env) {
    _env = env;
  }

  // Getter: 이제 앱 어디서든 AppConfig.env로 접근 가능
  static AppEnvironment get env => _env;

  // AdMob 설정 인스턴스
  static const AdmobConfig admob = AdmobConfig();

  // 서비스 정보
  static ServiceInfoModel? _serviceInfo;
  static ServiceInfoModel get serviceInfo {
    if (_serviceInfo == null) {
      debugPrint('⚠️ 서비스 정보가 아직 로드되지 않았습니다. 기본값을 반환합니다.');
      return defaultServiceInfo; // 기본값 반환 (앱 초기화 전에도 접근 가능)
    }
    return _serviceInfo!;
  }

  static void setServiceInfo(ServiceInfoModel info) {
    _serviceInfo = info;
  }

  // 서비스 코드
  static List<ServiceCodeModel>? _serviceCode;
  static List<ServiceCodeModel> get serviceCode {
    if (_serviceCode == null) {
      throw Exception('서비스 코드가 초기화되지 않았습니다.');
    }
    return _serviceCode!;
  }

  static void setServiceCode(List<ServiceCodeModel> code) {
    _serviceCode = code;
  }

  // =================================
  // 나머지 env 값들도 여기에 추가
  static String get host => dotenv.env['HOST'] ?? 'http://localhost:3000';
  static String get webSocketUrl =>
      dotenv.env['WEB_SOCKET_URL'] ?? 'http://localhost:3000';
  static String get webSocketPath =>
      dotenv.env['WEB_SOCKET_PATH'] ?? '/socket.io';
  static String get iosAppStoreId => dotenv.env['IOS_APP_STORE_ID'] ?? '';
  static String get androidPackageName =>
      dotenv.env['ANDROID_PACKAGE_NAME'] ?? 'com.example.app';
  // =================================

  static bool get isProduction => _env == AppEnvironment.prod;
  static bool get isIOS =>
      foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;
  static Platform get platform =>
      foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
      ? Platform.iOS
      : Platform.android;

  // 빌드 번호
  static int? _buildNumber;
  static int get buildNumber {
    if (_buildNumber == null) {
      // 초기화가 안 되었을 경우 디버깅을 위해 예외 발생
      throw Exception("AppConfig가 초기화되지 않았습니다. AppInitializer를 확인하세요.");
    }
    return _buildNumber!;
  }

  static void setBuildNumber(int value) {
    _buildNumber = value;
  }

  // =================================
  // Firebase 설정 옵션(보안을 위해 .env에서 불러오기)
  static FirebaseOptions get firebaseOptions {
    return FirebaseOptions(
      apiKey:
          dotenv.env[isIOS
              ? 'FIREBASE_API_KEY_IOS'
              : 'FIREBASE_API_KEY_ANDROID'] ??
          '',
      appId:
          dotenv.env[isIOS
              ? 'FIREBASE_APP_ID_IOS'
              : 'FIREBASE_APP_ID_ANDROID'] ??
          '',
      // 공통적으로 사용되는 값들
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
      projectId: dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
      storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '',

      // iOS 전용 설정 (Android일 때는 null)
      iosBundleId: isIOS ? (dotenv.env['FIREBASE_IOS_BUNDLE_ID'] ?? '') : null,
    );
  }

  static void debugMessage() async {
    final fb = firebaseOptions;
    final si = serviceInfo;

    debugPrint('\n==================================================');
    debugPrint('🛠️ [AppConfig Debug Info]');
    debugPrint('--------------------------------------------------');
    debugPrint('📌 Environment   : ${_env.toString()}');
    debugPrint('📱 Platform      : ${isIOS ? "iOS" : "Android"}');
    debugPrint('📏 Build Number  : $buildNumber');
    debugPrint('🌐 Host          : $host');
    debugPrint('🔌 WebSocket     : $webSocketUrl ($webSocketPath)');
    debugPrint('--------------------------------------------------');
    debugPrint('🔥 [Firebase Configuration]');
    debugPrint('   - Project ID  : ${fb.projectId}');
    debugPrint('   - App ID      : ${fb.appId}');
    debugPrint('   - API Key     : ${fb.apiKey}');
    debugPrint('   - Sender ID   : ${fb.messagingSenderId}');
    debugPrint('   - Bucket      : ${fb.storageBucket}');
    if (isIOS) {
      debugPrint('   - Bundle ID   : ${fb.iosBundleId}');
    }
    debugPrint('📢 [AdMob Configuration Check]');
    debugPrint('   (Target Platform: ${AppConfig.isIOS ? "iOS" : "Android"})');
    debugPrint('--------------------------------------------------');
    debugPrint('🆔 App ID                : ${admob.appId}');
    debugPrint('--------------------------------------------------');
    debugPrint('🖼️ 앱 오프닝 광고     : ${admob.launchBanner}');
    debugPrint('📏 적응형 배너       : ${admob.adaptiveBanner}');
    debugPrint('📌 고정 배너         : ${admob.fixedBanner}');
    debugPrint('📺 전면 광고         : ${admob.interstitial}');
    debugPrint('🎁 보상형 광고        : ${admob.rewarded}');
    debugPrint('🎁📺 보상형 전면 광고  : ${admob.rewardedInterstitial}');
    debugPrint('-----------------------------------------------');
    debugPrint('📌 서비스 정보');
    debugPrint('🏭 회사명        : ${si.companyName}');
    debugPrint('📀 서비스명      : ${si.serviceName}');
    debugPrint('🕺 대표자        : ${si.ceoName}');
    debugPrint('🏡 주소          : (${si.companyZipcode}) ${si.companyAddress}');
    debugPrint('📞 전화번호      : ${si.phone}');
    debugPrint('1️⃣ 사업자번호    : ${si.companyNumber}');
    debugPrint('🧑🏻‍🔬 청소년보호책임자 : ${si.privateManagerName}');
    debugPrint('📧 이메일        : ${si.email}');
    debugPrint('🌐 웹사이트      : ${si.serviceUrl}');
    debugPrint('📅 저작권 년도    : ${si.copyright}');
    debugPrint('🏢 회사 URL       : ${si.companyUrl}');
    debugPrint('--------------------------------------------------');
    debugPrint('🆔 서비스코드');
    if (serviceCode.isNotEmpty) {
      for (var code in serviceCode) {
        debugPrint('   - [${code.code}] ${code.name}');
      }
    } else {
      debugPrint('   서비스 코드가 없습니다.');
    }
    debugPrint('==================================================');
  }
}
