// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineDate _$TimelineDateFromJson(Map<String, dynamic> json) =>
    _TimelineDate(
      recordDate: json['recordDate'] as String,
      memo: json['memo'] as String?,
      foodLogs:
          (json['foodLogs'] as List<dynamic>?)
              ?.map((e) => FoodLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      healthLogs:
          (json['healthLogs'] as List<dynamic>?)
              ?.map((e) => HealthLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TimelineDateToJson(_TimelineDate instance) =>
    <String, dynamic>{
      'recordDate': instance.recordDate,
      'memo': instance.memo,
      'foodLogs': instance.foodLogs,
      'healthLogs': instance.healthLogs,
    };
