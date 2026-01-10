// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoticeModel _$NoticeModelFromJson(Map<String, dynamic> json) => _NoticeModel(
  sequence: (json['sequence'] as num).toInt(),
  type:
      $enumDecodeNullable(_$NoticeTypeEnumMap, json['type']) ??
      NoticeType.notice,
  faqKind: $enumDecodeNullable(_$NoticeFaqTypeEnumMap, json['faqKind']),
  title: json['title'] as String,
  content: json['content'] as String,
  createDate: DateTime.parse(json['createDate'] as String),
  isActivate: json['isActivate'] as bool? ?? false,
  categoryName: json['categoryName'] as String?,
);

Map<String, dynamic> _$NoticeModelToJson(_NoticeModel instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'type': _$NoticeTypeEnumMap[instance.type]!,
      'faqKind': _$NoticeFaqTypeEnumMap[instance.faqKind],
      'title': instance.title,
      'content': instance.content,
      'createDate': instance.createDate.toIso8601String(),
      'isActivate': instance.isActivate,
      'categoryName': instance.categoryName,
    };

const _$NoticeTypeEnumMap = {
  NoticeType.notice: 'notice',
  NoticeType.faq: 'faq',
};

const _$NoticeFaqTypeEnumMap = {
  NoticeFaqType.user: 'user',
  NoticeFaqType.service: 'service',
  NoticeFaqType.payment: 'payment',
  NoticeFaqType.unknown: 'unknown',
};
