// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FaqCategoryModel _$FaqCategoryModelFromJson(Map<String, dynamic> json) =>
    _FaqCategoryModel(
      faqKind: $enumDecode(_$NoticeFaqTypeEnumMap, json['faqKind']),
      faqName: json['faqName'] as String,
    );

Map<String, dynamic> _$FaqCategoryModelToJson(_FaqCategoryModel instance) =>
    <String, dynamic>{
      'faqKind': _$NoticeFaqTypeEnumMap[instance.faqKind]!,
      'faqName': instance.faqName,
    };

const _$NoticeFaqTypeEnumMap = {
  NoticeFaqType.user: 'user',
  NoticeFaqType.service: 'service',
  NoticeFaqType.payment: 'payment',
};
