import 'package:app/firebase_options.dart';
import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/enums/app_environment.enum.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await _loadEnvFile();

    debugPrint("========================================");
    debugPrint("🚀 앱 초기화 시작 (환경: ${AppConfig.env.name})");
    debugPrint("🌐 호스트 주소: ${AppConfig.host}");
    debugPrint("========================================");

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> _loadEnvFile() async {
    // 실행 인자에서 환경 파싱 (--dart-define=ENV=dev)
    const envStr = String.fromEnvironment('ENV', defaultValue: 'local');
    final env = AppEnvironment.parse(envStr);

    // .env 파일 로드
    await dotenv.load(fileName: env.fileName);

    // 결정된 환경 정보를 AppConfig에 등록! ✨
    AppConfig.setEnvironment(env);
  }
}
