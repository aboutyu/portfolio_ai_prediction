import 'package:collection/collection.dart';

enum AppEnvironment {
  local,
  dev,
  prod;

  /// .env 파일 경로를 반환하는 Getter
  String get fileName {
    switch (this) {
      case AppEnvironment.local:
        return 'assets/env/local.env';
      case AppEnvironment.dev:
        return 'assets/env/development.env';
      case AppEnvironment.prod:
        return 'assets/env/production.env';
    }
  }

  /// 파싱 로직 (대소문자 무시, 기본값 local)
  static AppEnvironment parse(String? value) {
    if (value == null) return AppEnvironment.local;
    return AppEnvironment.values.firstWhereOrNull(
          (e) => e.name.toLowerCase() == value.toLowerCase(),
        ) ??
        AppEnvironment.local;
  }
}
