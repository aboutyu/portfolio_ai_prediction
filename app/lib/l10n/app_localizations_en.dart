// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeNavigationText => 'Home';

  @override
  String get dailyNavigationText => 'Daily';

  @override
  String get chatNavigationText => 'Chat';

  @override
  String get myinfoNavigationText => 'MyInfo';

  @override
  String get dailyAppbarText => 'Daily';

  @override
  String get chatAppbarText => 'Chat';

  @override
  String get myinfoAppbarText => 'MyInfo';

  @override
  String get noUserInfoAvailable => 'No user information available.';

  @override
  String get buttonLogoutText => 'Logout';
}
