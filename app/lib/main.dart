import 'package:app/helpers/commons/colors.dart';
import 'package:app/helpers/routers/router.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/widgets/loading_indicator/loading_indicator_widget.dart';
import 'package:app/widgets/loading_indicator/loading_provider.dart';
import 'package:app/helpers/cores/app_initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.initialize(widgetsBinding);

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingProgress = ref.watch(loadingProviderProvider);
    final router = ref.watch(routerProvider);

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
        // 현재 로케일에 맞게 Intl 기본 로케일 설정
        final currentLocale = Localizations.localeOf(context);
        Intl.defaultLocale = currentLocale.toLanguageTag();

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
  }
}
