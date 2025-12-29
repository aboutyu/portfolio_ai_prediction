// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_item.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimelineItem _$TimelineItemFromJson(Map<String, dynamic> json) =>
    _TimelineItem(
      uuid: json['uuid'] as String,
      recordTime: DateTime.parse(json['recordTime'] as String),
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

Map<String, dynamic> _$TimelineItemToJson(_TimelineItem instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'recordTime': instance.recordTime.toIso8601String(),
      'memo': instance.memo,
      'foodLogs': instance.foodLogs,
      'healthLogs': instance.healthLogs,
    };

_FoodLog _$FoodLogFromJson(Map<String, dynamic> json) => _FoodLog(
  sequence: (json['sequence'] as num).toInt(),
  foodName: json['foodName'] as String,
  calories: (json['calories'] as num).toDouble(),
  recordDate: DateTime.parse(json['recordDate'] as String),
  groupUuid: json['groupUuid'] as String,
);

Map<String, dynamic> _$FoodLogToJson(_FoodLog instance) => <String, dynamic>{
  'sequence': instance.sequence,
  'foodName': instance.foodName,
  'calories': instance.calories,
  'recordDate': instance.recordDate.toIso8601String(),
  'groupUuid': instance.groupUuid,
};

_HealthLog _$HealthLogFromJson(Map<String, dynamic> json) => _HealthLog(
  sequence: (json['sequence'] as num).toInt(),
  groupUuid: json['groupUuid'] as String,
  healthType: $enumDecode(_$HealthLogTypeEnumMap, json['healthType']),
  healthValue: (json['healthValue'] as num).toDouble(),
  healthExtraValue: (json['healthExtraValue'] as num?)?.toDouble(),
  recordDate: DateTime.parse(json['recordDate'] as String),
);

Map<String, dynamic> _$HealthLogToJson(_HealthLog instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'groupUuid': instance.groupUuid,
      'healthType': _$HealthLogTypeEnumMap[instance.healthType]!,
      'healthValue': instance.healthValue,
      'healthExtraValue': instance.healthExtraValue,
      'recordDate': instance.recordDate.toIso8601String(),
    };

const _$HealthLogTypeEnumMap = {
  HealthLogType.SCT: 'SCT',
  HealthLogType.BPT: 'BPT',
  HealthLogType.BGT: 'BGT',
  HealthLogType.WGT: 'WGT',
};
