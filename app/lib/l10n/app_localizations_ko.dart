// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String tryCatchErrorText(String errorCode) {
    return '문제가 발생했습니다. 잠시 후 다시 시도해주세요.(에러코드: $errorCode)';
  }

  @override
  String challengeMessage(String username, String object, int day) {
    return '<blue>$username</blue>님은\n<red>$object</red>을 위해\n<brown>$day</brown>일째 도전 중입니다.';
  }

  @override
  String get signupText => '회원가입';

  @override
  String get loginText => '로그인';

  @override
  String get loginInputEmptyErrorText => '아이디 또는 비밀번호를 입력해주세요.';

  @override
  String get useridHintText => '아이디를 입력하세요';

  @override
  String get passwordHintText => '비밀번호를 입력하세요';

  @override
  String get passwordConfirmHintText => '비밀번호를 다시 입력하세요';

  @override
  String get usernameHintText => '이름을 입력하세요';

  @override
  String get interestHintText => '관심있는 분야를 모두 선택해주세요.';

  @override
  String get termsAgreeButtonText => '이용약관';

  @override
  String get guideButtonText => '이용안내';

  @override
  String get noticesButtonText => '공지사항';

  @override
  String get eventButtonText => '이벤트';

  @override
  String get faqsButtonText => '자주 묻는 질문';

  @override
  String get updateEssentialTitle => '업데이트 필요';

  @override
  String get updateEssentialMessage =>
      '새로운 버전의 앱이 출시되었습니다. 계속 이용하시려면 업데이트해주세요.';

  @override
  String get updateOptionalTitle => '업데이트 가능';

  @override
  String get updateOptionalMessage => '새로운 버전의 앱이 출시되었습니다. 지금 업데이트하시겠습니까?';

  @override
  String get laterButtonText => '나중에';

  @override
  String get updateButtonText => '업데이트';

  @override
  String get homeNavigationText => '홈';

  @override
  String get dailyNavigationText => '데일리';

  @override
  String get chatNavigationText => '채팅';

  @override
  String get myinfoNavigationText => '내정보';

  @override
  String get licenseInfoButtonText => '오픈소스 라이선스';

  @override
  String get noLicenseInfoAvailable => '라이선스 정보가 없습니다.';

  @override
  String get dailyAppbarText => '데일리';

  @override
  String get chatAppbarText => '채팅';

  @override
  String get myinfoAppbarText => '내정보';

  @override
  String get noUserInfoAvailable => '사용자 정보가 없습니다.';

  @override
  String get expiredLoginTokenText => '로그인 세션이 만료되었습니다. 다시 로그인해주세요.';

  @override
  String get expiredLoginTokenTitleText => '인증오류';

  @override
  String get buttonLogoutText => '로그아웃';

  @override
  String get dialogConfirmTitle => '확인';

  @override
  String get dialogCancelTitle => '취소';

  @override
  String get dialogSavedTitle => '저장';

  @override
  String get dialogChangeTitle => '변경';

  @override
  String get dialogDeleteTitle => '삭제';

  @override
  String get dialogClosedTitle => '닫기';

  @override
  String get dialogSearchTitle => '검색';

  @override
  String get dailyNoLogsText => '기록이 없습니다.';

  @override
  String get noticeNoText => '공지사항이 없습니다.';

  @override
  String get faqNoText => '자주 묻는 질문이 없습니다.';

  @override
  String get searchResultNoText => '검색결과가 없습니다.';

  @override
  String get dialogSearchHintText => '검색어를 입력해주세요.';

  @override
  String get todayRoutineProgressText => '오늘의 루틴 진행률';

  @override
  String get dailyFloatingFoodText => '식사기록';

  @override
  String get dailyFloatingWeightText => '체중기록';

  @override
  String get dailyFloatingStepcountText => '걸음수기록';

  @override
  String get dailyFloatingBloodGlucoseText => '혈당기록';

  @override
  String get dailyFloatingBloodPressureText => '혈압기록';

  @override
  String get dailyFoodLogTitle => '음식기록';

  @override
  String get dailyHealthLogTitle => '건강기록';

  @override
  String get recordDateText => '기록시간';

  @override
  String get foodLogCaloryText => '칼로리';

  @override
  String get foodLogCarbohydrateText => '탄수화물';

  @override
  String get foodLogProteinText => '단백질';

  @override
  String get foodLogFatText => '지방';

  @override
  String get foodLogSugarText => '당류';

  @override
  String get foodLogSodiumText => '나트륨';

  @override
  String get foodLogServingSizeText => '1회 제공량';

  @override
  String get foodLogNoCategoryText => '미분류';

  @override
  String get stepCountTypeText => '걸음수';

  @override
  String get bloodPressureTypeText => '혈압수치';

  @override
  String get bloodGlucoseTypeText => '혈당수치';

  @override
  String get weightTypeText => '체중';

  @override
  String get weightLogRecordTitle => '체중수정';

  @override
  String get weightLogInputHintWeightText => '체중을 입력하세요';

  @override
  String get stepcountLogRecordTitle => '걸음수수정';

  @override
  String get stepcountLogInputHintStepcountText => '걸음수를 입력하세요';

  @override
  String get stepcountLogUnitText => '걸음';

  @override
  String get bloodGlucoseLogRecordTitle => '혈당수정';

  @override
  String get bloodGlucoseLogInputHintBloodGlucoseText => '혈당을 입력하세요';

  @override
  String get bloodPressureLogRecordTitle => '혈압수정';

  @override
  String get bloodPressureLogInputHintDiastolicText => '이완기 혈압을 입력하세요';

  @override
  String get bloodPressureLogInputHintSystolicText => '수축기 혈압을 입력하세요';

  @override
  String get bloodPressureLogInputHintBloodPressureText => '혈압을 입력하세요';

  @override
  String get chatInputHintText => '메시지를 입력하세요';

  @override
  String get chatNoticeText =>
      '[AI는 의사가 아닙니다]\n답변은 참고용일 뿐, 의학적 결정은 반드시 전문가와 상의하세요. 모델 특성상 답변이 늦거나 부정확할 수 있습니다.';

  @override
  String get chatNoMessages => '메시지가 없습니다.';

  @override
  String get inputDateText => '날짜';

  @override
  String get inputHintMemoText => '메모를 입력하세요 (선택사항)';

  @override
  String get welcomeSuffix => '님\n환영합니다!';

  @override
  String get lastRecordedAt => '마지막 작성일';

  @override
  String get totalRecordCount => '전체 작성 개수';

  @override
  String get companyAddressText => '주소';

  @override
  String get companyContactText => '대표번호';

  @override
  String get companyCeoText => '대표이사';

  @override
  String get companyYouthProtectionManagerText => '청소년보호책임자';

  @override
  String get companyRegistrationText => '등록번호';

  @override
  String get companyName => '유태훈 스튜디오';

  @override
  String get companyServiceName => '헬스케어에스AI';

  @override
  String get companyAddress => '경기도 용인시 기흥구 구성로 (언남동, 동부센트레빌)';

  @override
  String get companyContact => '010-1234-5678';

  @override
  String get companyCeo => '유태훈';

  @override
  String get companyYouthProtectionManager => '유태훈';

  @override
  String get companyRegistration => '용인 제2024-1234호';
}
