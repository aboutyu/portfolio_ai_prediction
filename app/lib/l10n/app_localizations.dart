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

  /// No description provided for @expiredLoginTokenText.
  ///
  /// In ko, this message translates to:
  /// **'로그인 세션이 만료되었습니다. 다시 로그인해주세요.'**
  String get expiredLoginTokenText;

  /// No description provided for @expiredLoginTokenTitleText.
  ///
  /// In ko, this message translates to:
  /// **'인증오류'**
  String get expiredLoginTokenTitleText;

  /// No description provided for @buttonLogoutText.
  ///
  /// In ko, this message translates to:
  /// **'로그아웃'**
  String get buttonLogoutText;

  /// No description provided for @dialogConfirmTitle.
  ///
  /// In ko, this message translates to:
  /// **'확인'**
  String get dialogConfirmTitle;

  /// No description provided for @dialogCancelTitle.
  ///
  /// In ko, this message translates to:
  /// **'취소'**
  String get dialogCancelTitle;

  /// No description provided for @dialogSavedTitle.
  ///
  /// In ko, this message translates to:
  /// **'저장'**
  String get dialogSavedTitle;

  /// No description provided for @dialogChangeTitle.
  ///
  /// In ko, this message translates to:
  /// **'변경'**
  String get dialogChangeTitle;

  /// No description provided for @dialogDeleteTitle.
  ///
  /// In ko, this message translates to:
  /// **'삭제'**
  String get dialogDeleteTitle;

  /// No description provided for @dialogClosedTitle.
  ///
  /// In ko, this message translates to:
  /// **'닫기'**
  String get dialogClosedTitle;

  /// No description provided for @dailyNoLogsText.
  ///
  /// In ko, this message translates to:
  /// **'기록이 없습니다.'**
  String get dailyNoLogsText;

  /// No description provided for @dailyFloatingFoodText.
  ///
  /// In ko, this message translates to:
  /// **'식사기록'**
  String get dailyFloatingFoodText;

  /// No description provided for @dailyFloatingWeightText.
  ///
  /// In ko, this message translates to:
  /// **'체중기록'**
  String get dailyFloatingWeightText;

  /// No description provided for @dailyFloatingStepcountText.
  ///
  /// In ko, this message translates to:
  /// **'걸음수기록'**
  String get dailyFloatingStepcountText;

  /// No description provided for @dailyFloatingBloodGlucoseText.
  ///
  /// In ko, this message translates to:
  /// **'혈당기록'**
  String get dailyFloatingBloodGlucoseText;

  /// No description provided for @dailyFloatingBloodPressureText.
  ///
  /// In ko, this message translates to:
  /// **'혈압기록'**
  String get dailyFloatingBloodPressureText;

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
  /// **'혈압수치'**
  String get bloodPressureTypeText;

  /// No description provided for @bloodGlucoseTypeText.
  ///
  /// In ko, this message translates to:
  /// **'혈당수치'**
  String get bloodGlucoseTypeText;

  /// No description provided for @weightTypeText.
  ///
  /// In ko, this message translates to:
  /// **'체중'**
  String get weightTypeText;

  /// No description provided for @weightLogRecordTitle.
  ///
  /// In ko, this message translates to:
  /// **'체중수정'**
  String get weightLogRecordTitle;

  /// No description provided for @weightLogInputHintWeightText.
  ///
  /// In ko, this message translates to:
  /// **'체중을 입력하세요'**
  String get weightLogInputHintWeightText;

  /// No description provided for @stepcountLogRecordTitle.
  ///
  /// In ko, this message translates to:
  /// **'걸음수수정'**
  String get stepcountLogRecordTitle;

  /// No description provided for @stepcountLogInputHintStepcountText.
  ///
  /// In ko, this message translates to:
  /// **'걸음수를 입력하세요'**
  String get stepcountLogInputHintStepcountText;

  /// No description provided for @bloodGlucoseLogRecordTitle.
  ///
  /// In ko, this message translates to:
  /// **'혈당수정'**
  String get bloodGlucoseLogRecordTitle;

  /// No description provided for @bloodGlucoseLogInputHintBloodGlucoseText.
  ///
  /// In ko, this message translates to:
  /// **'혈당을 입력하세요'**
  String get bloodGlucoseLogInputHintBloodGlucoseText;

  /// No description provided for @bloodPressureLogRecordTitle.
  ///
  /// In ko, this message translates to:
  /// **'혈압수정'**
  String get bloodPressureLogRecordTitle;

  /// No description provided for @bloodPressureLogInputHintDiastolicText.
  ///
  /// In ko, this message translates to:
  /// **'이완기 혈압을 입력하세요'**
  String get bloodPressureLogInputHintDiastolicText;

  /// No description provided for @bloodPressureLogInputHintSystolicText.
  ///
  /// In ko, this message translates to:
  /// **'수축기 혈압을 입력하세요'**
  String get bloodPressureLogInputHintSystolicText;

  /// No description provided for @bloodPressureLogInputHintBloodPressureText.
  ///
  /// In ko, this message translates to:
  /// **'혈압을 입력하세요'**
  String get bloodPressureLogInputHintBloodPressureText;

  /// No description provided for @inputDateText.
  ///
  /// In ko, this message translates to:
  /// **'날짜'**
  String get inputDateText;

  /// No description provided for @inputHintMemoText.
  ///
  /// In ko, this message translates to:
  /// **'메모를 입력하세요 (선택사항)'**
  String get inputHintMemoText;
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
