// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String tryCatchErrorText(String errorCode) {
    return 'An error has occurred. Please try again later. (Error code: $errorCode)';
  }

  @override
  String get signupText => 'Sign Up';

  @override
  String get loginText => 'Log In';

  @override
  String get loginInputEmptyErrorText =>
      'Please enter your user ID and password.';

  @override
  String get useridHintText => 'Enter your user ID';

  @override
  String get passwordHintText => 'Enter your password';

  @override
  String get passwordConfirmHintText => 'Re-enter your password';

  @override
  String get usernameHintText => 'Enter your name';

  @override
  String get termsAgreeButtonText => ' Terms of Service';

  @override
  String get noticesButtonText => 'Notices';

  @override
  String get faqsButtonText => 'FAQ';

  @override
  String get homeNavigationText => 'Home';

  @override
  String get dailyNavigationText => 'Daily';

  @override
  String get chatNavigationText => 'Chat';

  @override
  String get myinfoNavigationText => 'MyInfo';

  @override
  String get licenseInfoButtonText => 'Open Source Licenses';

  @override
  String get noLicenseInfoAvailable => 'No license information available.';

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
  String get dialogChangeTitle => 'Change';

  @override
  String get dialogDeleteTitle => 'Delete';

  @override
  String get dialogClosedTitle => 'Close';

  @override
  String get dailyNoLogsText => 'No logs available.';

  @override
  String get noticeNoText => 'No notices available.';

  @override
  String get faqNoText => 'No frequently asked questions available.';

  @override
  String get dailyFloatingFoodText => 'Food Record';

  @override
  String get dailyFloatingWeightText => 'Weight Record';

  @override
  String get dailyFloatingStepcountText => 'Step Count Record';

  @override
  String get dailyFloatingBloodGlucoseText => 'Blood Glucose Record';

  @override
  String get dailyFloatingBloodPressureText => 'Blood Pressure Record';

  @override
  String get dailyFoodLogTitle => 'Food Record';

  @override
  String get dailyHealthLogTitle => 'Health Record';

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
  String get weightLogRecordTitle => 'Weight Edit';

  @override
  String get weightLogInputHintWeightText => 'Enter your weight';

  @override
  String get stepcountLogRecordTitle => 'Step Count Edit';

  @override
  String get stepcountLogInputHintStepcountText => 'Enter your step count';

  @override
  String get bloodGlucoseLogRecordTitle => 'Blood Glucose Edit';

  @override
  String get bloodGlucoseLogInputHintBloodGlucoseText =>
      'Enter your blood glucose';

  @override
  String get bloodPressureLogRecordTitle => 'Blood Pressure Edit';

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
