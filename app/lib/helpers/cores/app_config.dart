import 'package:app/helpers/enums/app_environment.enum.dart';
import 'package:app/helpers/enums/platform.enum.dart';
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
  // =================================

  static bool get isProduction => _env == AppEnvironment.prod;
  static Platform get platform =>
      foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS
      ? Platform.iOS
      : Platform.android;
}
