import 'package:app/helpers/dto/page_response.dto.dart';
import 'package:app/helpers/enums/response_code.enum.dart';
import 'package:app/helpers/enums/status_code.enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'core_response.model.freezed.dart';
part 'core_response.model.g.dart';

// [1] 제네릭 T를 처리하기 위해 genericArgumentFactories 옵션 필수
@Freezed(genericArgumentFactories: true)
abstract class CoreResponse<T> with _$CoreResponse<T> {
  const factory CoreResponse({
    required StatusCode status,
    ResponseCode? code,
    PageResponseDto? pageInfo,
    T? data,
  }) = _CoreResponse;

  factory CoreResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$CoreResponseFromJson(json, fromJsonT);
}
