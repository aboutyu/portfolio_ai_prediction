import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:app/screen/chat/presentation/views/chat_screen.dart';
import 'package:app/screen/daily/presentation/views/daily_screen.dart';
import 'package:app/screen/home/presentation/views/home_screen.dart';
import 'package:app/screen/my_info/presentation/views/my_info_screen.dart';
import 'package:app/screen/tabbar/presentation/views/tabbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/screen/auth/presentation/views/login_screen.dart';

part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  // 1. 유저 정보 상태를 계속 감시합니다.
  // (로그인/로그아웃/로딩 상태가 변하면 라우터가 재빌드됨)
  final authState = ref.watch(userInfoProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      // 1. 상태 로그 찍기
      final isLoading = authState.isLoading;
      final hasError = authState.hasError;
      final user = authState.value; // .value 대신 .valueOrNull 권장

      debugMessage([
        "🔍 [Router Check]",
        "- Loading: $isLoading",
        "- User: ${user?.username}",
        "- Current Path: ${state.uri.path}",
      ]);

      // (1) 로딩 중
      if (isLoading || hasError) {
        print(" -> 결과: 스플래시 유지 (/splash)");
        return '/splash';
      }

      final isLoggingIn = state.uri.path == '/login';
      final isSplash = state.uri.path == '/splash';

      // (2) 로그인 안 됨
      if (user == null) {
        print(" -> 결과: 로그인 필요 (Login)");
        return isLoggingIn ? null : '/login';
      }

      // (3) 로그인 됨
      if (isLoggingIn || isSplash) {
        print(" -> 결과: 홈으로 이동 (/)");
        return '/';
      }

      print(" -> 결과: 이동 없음 (null)");
      return null;
    },

    // 3. 라우트 정의
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => LoginScreen()),
      GoRoute(path: '/login', builder: (context, state) => LoginScreen()),

      GoRoute(path: '/', redirect: (context, state) => '/home'),

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
    ],
  );
}
