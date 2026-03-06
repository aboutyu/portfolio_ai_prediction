import 'package:app/helpers/commons/colors.dart';
import 'package:app/helpers/configures/app_config.dart';
import 'package:app/helpers/enums/app_environment.enum.dart';
import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/helpers/routers/router.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/widgets/loading_indicator/loading_indicator_widget.dart';
import 'package:app/widgets/loading_indicator/loading_provider.dart';
import 'package:app/helpers/initializations/app_initializer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 빌드 번호 가져오기
  final packageInfo = await PackageInfo.fromPlatform();
  final buildNum = int.tryParse(packageInfo.buildNumber) ?? 0;
  AppConfig.setBuildNumber(buildNum);

  // 실행 인자에서 환경 파싱 (--dart-define=ENV=dev)
  const envStr = String.fromEnvironment('ENV', defaultValue: 'local');
  final env = AppEnvironment.parse(envStr);
  await dotenv.load(fileName: env.fileName);
  AppConfig.setEnvironment(env);

  // intl 패키지의 날짜 포맷 초기화
  await initializeDateFormatting();

  // firebase, admob 초기화
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(options: AppConfig.firebaseOptions);
  }
  await MobileAds.instance.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingProgress = ref.watch(loadingProviderProvider);
    final router = ref.watch(routerProvider);
    final initStatus = ref.watch(appInitializationProvider);

    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Pretendard',
        appBarTheme: AppBarTheme(
          backgroundColor: appbarBackgroundColor,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          centerTitle: true,
          elevation: 1,
        ),
      ),

      // 다국어 지원 설정
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'), // 한국어
        Locale('en', 'US'), // 영어
      ],

      routerConfig: router,
      builder: (context, child) {
        return initStatus.draws(
          data: (data) {
            // 현재 로케일에 맞게 Intl 기본 로케일 설정
            final currentLocale = Localizations.localeOf(context);
            Intl.defaultLocale = currentLocale.toLanguageTag();

            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   ref.read(appUpdateServiceProvider.notifier).checkUpdate(context);
            // });

            return LoadingIndicatorWidget(
              isLoading: isLoadingProgress,
              child: GestureDetector(
                onTap: () {
                  // 화면 어디든 터치하면 키보드 내림 (포커스 해제)
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: child,
              ),
            );
          },
        );
      },
    );
  }
}
