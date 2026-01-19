import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:app/screen/auth/presentation/views/signup_screen.dart';
import 'package:app/screen/auth/presentation/views/terms_screen.dart';
import 'package:app/screen/chat/presentation/views/chat_screen.dart';
import 'package:app/screen/daily/presentation/views/daily_screen.dart';
import 'package:app/screen/daily/presentation/views/record_food_screen.dart';
import 'package:app/screen/home/presentation/views/home_screen.dart';
import 'package:app/screen/my_info/presentation/views/license_screen.dart';
import 'package:app/screen/my_info/presentation/views/my_info_screen.dart';
import 'package:app/screen/notices/presentation/views/faq_screen.dart';
import 'package:app/screen/notices/presentation/views/notice_screen.dart';
import 'package:app/screen/tabbar/presentation/views/tabbar_screen.dart';
import 'package:app/widgets/splash/splash_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/screen/auth/presentation/views/login_screen.dart';

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  // 1. 유저 정보 상태를 계속 감시합니다.
  // (로그인/로그아웃/로딩 상태가 변하면 라우터가 재빌드됨)
  final authState = ref.watch(userInfoProvider);

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/splash',
    redirect: (context, state) {
      final currentPath = state.uri.path;

      // 1. 상태 로그 찍기
      final isLoading = authState.isLoading;
      final hasError = authState.hasError;
      final user = authState.value;

      debugMessage([
        "🔍 [Router Check]",
        "- Loading: $isLoading",
        "- User: ${user?.username}",
        "- Current Path: $currentPath",
      ]);

      // -------------------------------------------------------
      // 화면 성격 정의 (이 부분만 수정하면 관리가 편해집니다)
      // -------------------------------------------------------

      // ① 로그인했으면 절대 못 들어가는 화면 (게스트 전용)
      //    예: 로그인 화면, 회원가입 화면, 스플래시
      final isGuestOnlyPath =
          currentPath == '/login' ||
          currentPath == '/signup' ||
          currentPath == '/splash';

      // ② 로그인 여부와 상관없이 누구나 볼 수 있는 화면 (공용)
      //    예: 이용약관, 공지사항 등
      final isUniversalPath = currentPath == '/terms';
      // -------------------------------------------------------

      // (1) 로딩 중
      if (isLoading || hasError) {
        debugPrint(" -> 결과: 스플래시 유지 (/splash)");
        return '/splash';
      }

      if (user == null) {
        // (1) 게스트 전용 화면(로그인, 회원가입)이나 공용 화면(약관)으로 가는 중인가?
        if (isGuestOnlyPath || isUniversalPath) {
          // 통과 (로그인 안 해도 갈 수 있는 곳들이므로)
          return null;
        }

        // (2) 그 외(홈, 마이페이지 등) 로그인이 필요한 곳을 가려고 한다면?
        // 로그인 화면으로 강제 이동
        return '/login';
      }

      // (3) 로그인 됨
      if (isGuestOnlyPath) {
        debugPrint(" -> 결과: 홈으로 이동 (/)");
        return '/';
      }

      debugPrint(" -> 결과: 이동 없음 (null)");
      return null;
    },

    // 3. 라우트 정의
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => SplashWidget()),
      GoRoute(
        path: '/login',
        builder: (context, state) {
          FlutterNativeSplash.remove();
          return LoginScreen();
        },
      ),
      GoRoute(path: '/signup', builder: (context, state) => SignupScreen()),

      GoRoute(
        path: '/',
        redirect: (context, state) {
          FlutterNativeSplash.remove();
          return '/home';
        },
      ),

      GoRoute(
        path: '/terms',
        pageBuilder: (context, state) {
          final index =
              state.extra != null &&
                  state.extra is Map<String, dynamic> &&
                  (state.extra as Map<String, dynamic>).containsKey('index')
              ? (state.extra as Map<String, dynamic>)['index'] as int
              : 0;
          return MaterialPage(
            key: state.pageKey,
            child: TermsScreen(index: index),
            fullscreenDialog: true,
          );
        },
      ),
      GoRoute(
        path: '/licenses',
        builder: (context, state) => const LicenseScreen(),
      ),
      GoRoute(
        path: '/notice',
        builder: (context, state) => const NoticeScreen(),
      ),
      GoRoute(path: '/faq', builder: (context, state) => const FaqScreen()),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return TabbarScreen(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/daily',
                builder: (context, state) => const DailyScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/chat',
                builder: (context, state) => const ChatScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/myinfo',
                builder: (context, state) => const MyInfoScreen(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: '/record/food',
        builder: (context, state) => const RecordFoodScreen(),
      ),
    ],
  );
}
