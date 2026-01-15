import 'package:app/helpers/enums/app_environment.enum.dart';
import 'package:app/helpers/enums/platform.enum.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  const AppConfig._();

  static late AppEnvironment _env;
  static void setEnvironment(AppEnvironment env) {
    _env = env;
  }

  // Getter: 이제 앱 어디서든 AppConfig.env로 접근 가능
  static AppEnvironment get env => _env;

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

  // =================================
}
