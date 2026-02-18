import 'package:app/helpers/cores/admob_config.dart';
import 'package:app/helpers/enums/app_environment.enum.dart';
import 'package:app/helpers/enums/platform.enum.dart';
import 'package:app/helpers/models/service_info_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/foundation.dart';
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
  static ServiceInfoModel get serviceInfo =>
      _serviceInfo ??
      ServiceInfoModel(
        ceoName: '',
        companyAddress: '',
        companyName: '',
        companyNumber: '',
        companyUrl: '',
        companyZipcode: '',
        email: '',
        language: '',
        memo: '',
        privateManagerName: '',
        serviceName: '',
        serviceUrl: '',
        telecomSellerNumber: '',
        copyright: 2026,
        phone: '',
      );
  static void setServiceInfo(ServiceInfoModel info) {
    _serviceInfo = info;
  }

  // =================================
  // 나머지 env 값들도 여기에 추가
  static String get host => dotenv.env['HOST'] ?? 'http://localhost:3000';
  static String get webSocketUrl =>
      dotenv.env['WEB_SOCKET_URL'] ?? 'http://localhost:3000';
  static String get webSocketPath =>
      dotenv.env['WEB_SOCKET_PATH'] ?? '/socket.io';
  // =================================

  static bool get isProduction => _env == AppEnvironment.prod;
  static bool get isIOS =>
      foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS;
  static Platform get platform =>
      foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
      ? Platform.iOS
      : Platform.android;

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

  static void debugMessage() {
    final fb = firebaseOptions;
    debugPrint('\n==================================================');
    debugPrint('🛠️ [AppConfig Debug Info]');
    debugPrint('--------------------------------------------------');
    debugPrint('📌 Environment   : ${_env.toString()}');
    debugPrint('📱 Platform      : ${isIOS ? "iOS" : "Android"}');
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
    debugPrint('   - 회사명        : ${serviceInfo.companyName}');
    debugPrint('   - 서비스명      : ${serviceInfo.serviceName}');
    debugPrint('   - 대표자        : ${serviceInfo.ceoName}');
    debugPrint('   - 주소          : ${serviceInfo.companyAddress}');
    debugPrint('   - 전화번호      : ${serviceInfo.phone}');
    debugPrint('   - 사업자번호    : ${serviceInfo.companyNumber}');
    debugPrint('==================================================');
  }
}
