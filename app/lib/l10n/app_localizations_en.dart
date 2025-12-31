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
  String get expiredLoginTokenText =>
      'Your login session has expired. Please log in again.';

  @override
  String get expiredLoginTokenTitleText => 'Authentication Error';

  @override
  String get buttonLogoutText => 'Logout';

  @override
  String get dialogConfirmTitle => 'Confirm';

  @override
  String get dialogCancelTitle => 'Cancel';

  @override
  String get dialogSavedTitle => 'Save';

  @override
  String get dialogClosedTitle => 'Close';

  @override
  String get dailyNoLogsText => 'No logs available.';

  @override
  String get dailyFoodLogTitle => 'Food Log';

  @override
  String get dailyHealthLogTitle => 'Health Log';

  @override
  String get recordDateText => 'Record Time';

  @override
  String get stepCountTypeText => 'Step Count';

  @override
  String get bloodPressureTypeText => 'Blood Pressure';

  @override
  String get bloodGlucoseTypeText => 'Blood Glucose';

  @override
  String get weightTypeText => 'Weight';

  @override
  String get weightLogRecordTitle => 'Record Weight Write/Edit';

  @override
  String get weightLogInputHintWeightText => 'Enter your weight';

  @override
  String get stepcountLogRecordTitle => 'Record Step Count Write/Edit';

  @override
  String get stepcountLogInputHintStepcountText => 'Enter your step count';

  @override
  String get bloodGlucoseLogRecordTitle => 'Record Blood Glucose Write/Edit';

  @override
  String get bloodGlucoseLogInputHintBloodGlucoseText =>
      'Enter your blood glucose';

  @override
  String get bloodPressureLogRecordTitle => 'Record Blood Pressure Write/Edit';

  @override
  String get bloodPressureLogInputHintDiastolicText =>
      'Enter your diastolic blood pressure';

  @override
  String get bloodPressureLogInputHintSystolicText =>
      'Enter your systolic blood pressure';

  @override
  String get bloodPressureLogInputHintBloodPressureText =>
      'Enter your blood pressure';

  @override
  String get inputDateText => 'Date';

  @override
  String get inputHintMemoText => 'Enter a memo (optional)';
}
