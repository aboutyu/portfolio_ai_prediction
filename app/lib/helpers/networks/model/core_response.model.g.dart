// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoreResponse<T> _$CoreResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _CoreResponse<T>(
  status: $enumDecode(_$StatusCodeEnumMap, json['status']),
  code: $enumDecodeNullable(_$ResponseCodeEnumMap, json['code']),
  pageInfo: json['pageInfo'] == null
      ? null
      : PageResponseDto.fromJson(json['pageInfo'] as Map<String, dynamic>),
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$CoreResponseToJson<T>(
  _CoreResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'status': _$StatusCodeEnumMap[instance.status]!,
  'code': _$ResponseCodeEnumMap[instance.code],
  'pageInfo': instance.pageInfo,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

const _$StatusCodeEnumMap = {
  StatusCode.success: 'success',
  StatusCode.error: 'error',
  StatusCode.failed: 'failed',
};

const _$ResponseCodeEnumMap = {
  ResponseCode.forbidden: 'forbidden',
  ResponseCode.internalError: 'internalError',
  ResponseCode.unauthorized: 'unauthorized',
  ResponseCode.notFoundUser: 'notFoundUser',
  ResponseCode.loginFailed: 'loginFailed',
  ResponseCode.signupExistingUser: 'signupExistingUser',
  ResponseCode.notImplemented: 'notImplemented',
  ResponseCode.doNotHaveSequence: 'doNotHaveSequence',
  ResponseCode.invalidParam: 'invalidParam',
  ResponseCode.doNotHaveData: 'doNotHaveData',
  ResponseCode.unknown: 'unknown',
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);
