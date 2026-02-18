// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceCodeModel _$ServiceCodeModelFromJson(Map<String, dynamic> json) =>
    _ServiceCodeModel(
      sequence: (json['sequence'] as num).toInt(),
      code: json['code'] as String,
      type:
          $enumDecodeNullable(_$ServiceCodeTypeEnumMap, json['type']) ??
          ServiceCodeType.itp,
      name: json['name'] as String,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$ServiceCodeModelToJson(_ServiceCodeModel instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'code': instance.code,
      'type': _$ServiceCodeTypeEnumMap[instance.type]!,
      'name': instance.name,
      'memo': instance.memo,
    };

const _$ServiceCodeTypeEnumMap = {ServiceCodeType.itp: 'ITP'};
