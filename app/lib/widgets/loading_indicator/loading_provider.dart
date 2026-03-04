import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'loading_provider.g.dart';

@Riverpod(keepAlive: true) // 앱 전역에서 쓰므로 죽지 않게 설정
class LoadingProvider extends _$LoadingProvider {
  @override
  bool build() => false; // 초기값: 로딩 아님

  void start() => state = true;
  void finish() => state = false;
}
