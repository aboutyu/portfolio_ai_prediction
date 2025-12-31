import 'dart:io';
import 'package:flutter/foundation.dart';

const bool isDebug = kDebugMode;
final String deviceType = Platform.isAndroid ? 'aos' : 'ios';

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
