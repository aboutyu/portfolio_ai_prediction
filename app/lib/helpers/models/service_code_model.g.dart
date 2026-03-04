// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServiceCodeModel _$ServiceCodeModelFromJson(Map<String, dynamic> json) =>
    _ServiceCodeModel(
      code: $enumDecode(_$ServiceCodeTypeEnumMap, json['code']),
      items: (json['items'] as List<dynamic>)
          .map((e) => ServiceCodeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceCodeModelToJson(_ServiceCodeModel instance) =>
    <String, dynamic>{
      'code': _$ServiceCodeTypeEnumMap[instance.code]!,
      'items': instance.items,
    };

const _$ServiceCodeTypeEnumMap = {
  ServiceCodeType.itp: 'ITP',
  ServiceCodeType.obj: 'OBJ',
};

_ServiceCodeItem _$ServiceCodeItemFromJson(Map<String, dynamic> json) =>
    _ServiceCodeItem(
      code: json['code'] as String,
      codeName: json['codeName'] as String,
      type: $enumDecode(_$ServiceCodeTypeEnumMap, json['type']),
      names: (json['names'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ServiceCodeItemToJson(_ServiceCodeItem instance) =>
    <String, dynamic>{
      'code': instance.code,
      'codeName': instance.codeName,
      'type': _$ServiceCodeTypeEnumMap[instance.type]!,
      'names': instance.names,
    };
