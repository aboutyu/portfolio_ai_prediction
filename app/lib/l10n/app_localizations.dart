import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko'),
  ];

  /// No description provided for @homeNavigationText.
  ///
  /// In ko, this message translates to:
  /// **'홈'**
  String get homeNavigationText;

  /// No description provided for @dailyNavigationText.
  ///
  /// In ko, this message translates to:
  /// **'데일리'**
  String get dailyNavigationText;

  /// No description provided for @chatNavigationText.
  ///
  /// In ko, this message translates to:
  /// **'채팅'**
  String get chatNavigationText;

  /// No description provided for @myinfoNavigationText.
  ///
  /// In ko, this message translates to:
  /// **'내정보'**
  String get myinfoNavigationText;

  /// No description provided for @dailyAppbarText.
  ///
  /// In ko, this message translates to:
  /// **'데일리'**
  String get dailyAppbarText;

  /// No description provided for @chatAppbarText.
  ///
  /// In ko, this message translates to:
  /// **'채팅'**
  String get chatAppbarText;

  /// No description provided for @myinfoAppbarText.
  ///
  /// In ko, this message translates to:
  /// **'내정보'**
  String get myinfoAppbarText;

  /// No description provided for @noUserInfoAvailable.
  ///
  /// In ko, this message translates to:
  /// **'사용자 정보가 없습니다.'**
  String get noUserInfoAvailable;

  /// No description provided for @buttonLogoutText.
  ///
  /// In ko, this message translates to:
  /// **'로그아웃'**
  String get buttonLogoutText;

  /// No description provided for @dailyNoLogsText.
  ///
  /// In ko, this message translates to:
  /// **'기록이 없습니다.'**
  String get dailyNoLogsText;

  /// No description provided for @dailyFoodLogTitle.
  ///
  /// In ko, this message translates to:
  /// **'음식기록'**
  String get dailyFoodLogTitle;

  /// No description provided for @dailyHealthLogTitle.
  ///
  /// In ko, this message translates to:
  /// **'건강기록'**
  String get dailyHealthLogTitle;

  /// No description provided for @recordDateText.
  ///
  /// In ko, this message translates to:
  /// **'기록시간'**
  String get recordDateText;

  /// No description provided for @stepCountTypeText.
  ///
  /// In ko, this message translates to:
  /// **'걸음수'**
  String get stepCountTypeText;

  /// No description provided for @bloodPressureTypeText.
  ///
  /// In ko, this message translates to:
  /// **'심박수'**
  String get bloodPressureTypeText;

  /// No description provided for @bloodGlucoseTypeText.
  ///
  /// In ko, this message translates to:
  /// **'수면시간'**
  String get bloodGlucoseTypeText;

  /// No description provided for @weightTypeText.
  ///
  /// In ko, this message translates to:
  /// **'체중'**
  String get weightTypeText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ko':
      return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
