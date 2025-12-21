import 'package:app/helpers/storages/user_info.dart';
import 'package:app/screen/home/presentation/views/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:app/screen/auth/presentation/views/login_screen.dart';

part 'router_app.g.dart';

@riverpod
GoRouter router(Ref ref) {
  // 1. 유저 정보 상태를 계속 감시합니다.
  // (로그인/로그아웃/로딩 상태가 변하면 라우터가 재빌드됨)
  final authState = ref.watch(userInfoProvider);

  return GoRouter(
    // 초기 진입점: 스토리지 검사가 끝날 때까지 스플래시 화면을 보여주는 게 좋습니다.
    initialLocation: '/splash',

    // 2. 리다이렉트 로직 (핵심)
    redirect: (context, state) {
      // (1) 로딩 중이면 스플래시 화면 유지
      if (authState.isLoading || authState.hasError) {
        return '/splash';
      }

      // (2) 로딩 끝! 유저 정보 확인
      final user = authState.value; // 데이터가 있으면 유저 객체, 없으면 null

      final isLoggingIn = state.uri.path == '/login';
      final isSplash = state.uri.path == '/splash';

      // Case A: 로그인 안 된 상태 (user == null)
      if (user == null) {
        // 이미 로그인 화면이거나 스플래시라면 가만히 둠 -> 아니면 로그인으로 이동
        return isLoggingIn ? null : '/login';
      }

      // Case B: 로그인 된 상태 (user != null)
      // 로그인 화면이나 스플래시 화면에 있다면 -> 홈으로 보내버림
      if (isLoggingIn || isSplash) {
        return '/';
      }

      // 그 외에는 가던 길 감
      return null;
    },

    // 3. 라우트 정의
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => LoginScreen()),
      GoRoute(path: '/login', builder: (_, __) => LoginScreen()),
      GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
    ],
  );
}
