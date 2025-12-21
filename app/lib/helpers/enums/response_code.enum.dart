import 'package:freezed_annotation/freezed_annotation.dart';

/// ResponseCode
enum ResponseCode {
  // --- ErrorCode ---
  @JsonValue('forbidden')
  forbidden,
  @JsonValue('internalError')
  internalError,

  // --- FailureCode ---
  @JsonValue('unauthorized')
  unauthorized,
  @JsonValue('notFoundUser')
  notFoundUser,
  @JsonValue('loginFailed')
  loginFailed,
  @JsonValue('signupExistingUser')
  signupExistingUser,
  @JsonValue('notImplemented')
  notImplemented,
  @JsonValue('doNotHaveSequence')
  doNotHaveSequence,
  @JsonValue('invalidParam')
  invalidParam,
  @JsonValue('doNotHaveData')
  doNotHaveData,

  // 정의되지 않은 코드가 넘어올 경우를 대비한 fallback
  @JsonValue('unknown')
  unknown,
}

extension ResponseCodeExtension on ResponseCode {
  String get message {
    switch (this) {
      case ResponseCode.forbidden:
        return '접근이 금지되었습니다.';
      case ResponseCode.internalError:
        return '서버 내부 오류가 발생했습니다.';
      case ResponseCode.unauthorized:
        return '인증이 필요합니다.';
      case ResponseCode.notFoundUser:
        return '사용자를 찾을 수 없습니다.';
      case ResponseCode.loginFailed:
        return '로그인에 실패했습니다.';
      case ResponseCode.signupExistingUser:
        return '이미 존재하는 사용자입니다.';
      case ResponseCode.notImplemented:
        return '구현되지 않은 기능입니다.';
      case ResponseCode.doNotHaveSequence:
        return '시퀀스가 없습니다.';
      case ResponseCode.invalidParam:
        return '잘못된 매개변수입니다.';
      case ResponseCode.doNotHaveData:
        return '데이터가 없습니다.';
      case ResponseCode.unknown:
        return '알 수 없는 오류가 발생했습니다.';
    }
  }
}
