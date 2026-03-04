// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageResponseDto _$PageResponseDtoFromJson(Map<String, dynamic> json) =>
    _PageResponseDto(
      page: (json['page'] as num?)?.toInt() ?? 0,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      pageCount: (json['pageCount'] as num?)?.toInt() ?? 0,
      pageNum: (json['pageNum'] as num?)?.toInt() ?? 10,
    );

Map<String, dynamic> _$PageResponseDtoToJson(_PageResponseDto instance) =>
    <String, dynamic>{
      'page': instance.page,
      'totalCount': instance.totalCount,
      'pageCount': instance.pageCount,
      'pageNum': instance.pageNum,
    };
