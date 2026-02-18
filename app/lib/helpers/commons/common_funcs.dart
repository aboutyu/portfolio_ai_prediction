import 'dart:io';
import 'dart:ui';
import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/helpers/models/service_info_model.dart';
import 'package:app/helpers/routers/router.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

const bool isDebug = kDebugMode;
final String deviceType = Platform.isAndroid ? 'aos' : 'ios';
final String localeName = Platform.localeName;
final AppLocalizations? al = rootNavigatorKey.currentContext?.tr;

String get appStoreUrl =>
    'https://apps.apple.com/app/id${AppConfig.iosAppStoreId}';
String get playStoreUrl =>
    'https://play.google.com/store/apps/details?id=${AppConfig.androidPackageName}';

final Locale _deviceLocale = PlatformDispatcher.instance.locale;
final String localeLanguage = _deviceLocale.languageCode; // "ko"
final String? localeCountry = _deviceLocale.countryCode; // "KR"

final int defaultPageNum = 20;

// 캘린더의 첫 번째 날짜와 마지막 날짜 정의
final firstCalendarDate = DateTime(2025, 1, 1);
DateTime get lastCalendarDate => DateTime.now();

/// [message] : 출력할 내용 (변수 또는 배열)
void debugMessage(dynamic message) {
  debugPrint("💬 ====== DEBUG MESSAGE =====================");
  // 내용(contents)이 있으면 출력
  if (message is List) {
    for (var i = 0; i < message.length; i++) {
      debugPrint('${i + 1}. ${message[i]}');
    }
  } else {
    debugPrint(message);
  }
  debugPrint("=============================================");
}

// 스토어 이동
Future<void> openStore() async {
  final url = AppConfig.isIOS ? appStoreUrl : playStoreUrl;
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    debugMessage('Could not launch $url');
  }
}

// 기본 서비스 정보
ServiceInfoModel get defaultServiceInfo => ServiceInfoModel(
  companyName: al?.companyName ?? '회사명',
  serviceName: al?.companyServiceName ?? '서비스명',
  companyAddress: al?.companyAddress ?? '회사 주소',
  ceoName: al?.companyCeo ?? '대표자명',
  privateManagerName: al?.companyYouthProtectionManager ?? '청소년 보호 책임자명',
  companyNumber: al?.companyRegistration ?? '사업자 등록 번호',
  telecomSellerNumber: '-',
  companyZipcode: '-',
  phone: '-',
  language: '-',
  memo: '-',
  copyright: 2026,
  companyUrl: '-',
  serviceUrl: '-',
  email: '-',
);
