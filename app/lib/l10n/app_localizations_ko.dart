// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get homeNavigationText => '홈';

  @override
  String get dailyNavigationText => '데일리';

  @override
  String get chatNavigationText => '채팅';

  @override
  String get myinfoNavigationText => '내정보';

  @override
  String get dailyAppbarText => '데일리';

  @override
  String get chatAppbarText => '채팅';

  @override
  String get myinfoAppbarText => '내정보';

  @override
  String get noUserInfoAvailable => '사용자 정보가 없습니다.';

  @override
  String get buttonLogoutText => '로그아웃';

  @override
  String get dailyNoLogsText => '기록이 없습니다.';

  @override
  String get dailyFoodLogTitle => '음식기록';

  @override
  String get dailyHealthLogTitle => '건강기록';

  @override
  String get recordDateText => '기록시간';

  @override
  String get stepCountTypeText => '걸음수';

  @override
  String get bloodPressureTypeText => '심박수';

  @override
  String get bloodGlucoseTypeText => '수면시간';

  @override
  String get weightTypeText => '체중';
}
