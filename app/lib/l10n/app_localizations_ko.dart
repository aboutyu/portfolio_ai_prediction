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
}
