// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TermsModel _$TermsModelFromJson(Map<String, dynamic> json) => _TermsModel(
  sequence: (json['sequence'] as num).toInt(),
  type:
      $enumDecodeNullable(_$TermsTypeEnumMap, json['type']) ??
      TermsType.service,
  title: json['title'] as String,
  content: json['content'] as String,
  isRequired: json['isRequired'] as bool,
  isActivate: json['isActivate'] as bool,
  createDate: DateTime.parse(json['create_date'] as String),
  termsName: json['termsName'] as String,
);

Map<String, dynamic> _$TermsModelToJson(_TermsModel instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'type': _$TermsTypeEnumMap[instance.type]!,
      'title': instance.title,
      'content': instance.content,
      'isRequired': instance.isRequired,
      'isActivate': instance.isActivate,
      'create_date': instance.createDate.toIso8601String(),
      'termsName': instance.termsName,
    };

const _$TermsTypeEnumMap = {
  TermsType.service: 'service',
  TermsType.privacy: 'privacy',
  TermsType.marketing: 'marketing',
};
