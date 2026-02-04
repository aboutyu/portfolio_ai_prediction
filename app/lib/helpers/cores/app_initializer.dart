import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/enums/app_environment.enum.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize(WidgetsBinding widgetsBinding) async {
    WidgetsFlutterBinding.ensureInitialized();

    await _loadEnvFile();

    AppConfig.debugMessage();

    // intl 패키지의 날짜 포맷 초기화
    await initializeDateFormatting();

    // firebase 초기화
    await Firebase.initializeApp(options: AppConfig.firebaseOptions);

    // AdMob 초기화
    await MobileAds.instance.initialize();

    // Splash 화면 유지
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  static Future<void> _loadEnvFile() async {
    // 실행 인자에서 환경 파싱 (--dart-define=ENV=dev)
    const envStr = String.fromEnvironment('ENV', defaultValue: 'local');
    final env = AppEnvironment.parse(envStr);

    // .env 파일 로드
    await dotenv.load(fileName: env.fileName);

    // 환경 정보를 AppConfig에 등록!
    AppConfig.setEnvironment(env);
  }
}
