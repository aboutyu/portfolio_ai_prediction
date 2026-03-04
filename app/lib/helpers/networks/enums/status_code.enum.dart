import 'package:freezed_annotation/freezed_annotation.dart';

/// [StatusCode] - API 요청 성공/실패 여부
enum StatusCode {
  @JsonValue('success')
  success,
  @JsonValue('error')
  error,
  @JsonValue('failed')
  failed,
}
