import 'dart:convert';

import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/enums/app_environment.enum.dart';
import 'package:app/helpers/models/service_info_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:intl/date_symbol_data_local.dart';

class AppInitializer {
  const AppInitializer._();

  static Future<void> initialize(WidgetsBinding widgetsBinding) async {
    WidgetsFlutterBinding.ensureInitialized();

    await _loadEnvFile();
    await _fetchServiceInfo();

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

  static Future<void> _fetchServiceInfo() async {
    try {
      // API 주소는 환경변수(dotenv)에 등록된 baseUrl을 사용하세요
      final String baseUrl = AppConfig.host;
      final response = await http.get(
        Uri.parse('$baseUrl/system/service-info'),
      );

      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        if (decodedData['status'] == 'success') {
          final serviceInfo = ServiceInfoModel.fromJson(decodedData['data']);
          AppConfig.setServiceInfo(serviceInfo);
        }
      }
    } catch (e) {
      debugPrint('서비스 정보 로드 실패: $e');
    }
  }
}
