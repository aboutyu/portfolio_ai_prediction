import 'package:freezed_annotation/freezed_annotation.dart';

/// [ResponseCode]
/// TypeScript의 ErrorCode와 FailureCode를 하나로 통합하여 관리합니다.
/// Dart에서는 변수 하나에 두 개의 Enum 타입을 동시에 지정할 수 없기 때문입니다.
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

  // (선택사항) 정의되지 않은 코드가 넘어올 경우를 대비한 fallback
  @JsonValue('unknown')
  unknown,
}
