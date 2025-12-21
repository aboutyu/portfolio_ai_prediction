import 'package:flutter/foundation.dart';

const bool isDebug = kDebugMode;

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
