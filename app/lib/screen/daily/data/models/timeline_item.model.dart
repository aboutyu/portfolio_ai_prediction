import 'package:app/helpers/enums/daily_quick_menu_type.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_item.model.freezed.dart';
part 'timeline_item.model.g.dart';

enum TimelineLogType { food, health }

enum HealthLogType {
  @JsonValue('SCT')
  SCT, // Step Count Type(걸음수, 만보계)

  @JsonValue('BPT')
  BPT, // Blood Pressure Type(혈압)

  @JsonValue('BGT')
  BGT, // Blood Glucose Type(혈당)

  @JsonValue('WGT')
  WGT, // Weight(체중)
}

extension HealthLogTypeExtension on HealthLogType {
  String get code => name;

  String displayName(BuildContext context) {
    switch (this) {
      case HealthLogType.SCT:
        return context.tr.stepCountTypeText;
      case HealthLogType.BPT:
        return context.tr.bloodPressureTypeText;
      case HealthLogType.BGT:
        return context.tr.bloodGlucoseTypeText;
      case HealthLogType.WGT:
        return context.tr.weightTypeText;
    }
  }

  DailyQuickMenuType get toDailyQuickMenuType {
    switch (this) {
      case HealthLogType.SCT:
        return DailyQuickMenuType.stepCount;
      case HealthLogType.BPT:
        return DailyQuickMenuType.bp;
      case HealthLogType.BGT:
        return DailyQuickMenuType.glucose;
      case HealthLogType.WGT:
        return DailyQuickMenuType.weight;
    }
  }
}

/// 타임라인 아이템
@freezed
abstract class TimelineItem with _$TimelineItem {
  const TimelineItem._();

  factory TimelineItem({
    required String uuid,
    required DateTime recordTime,
    String? memo, // null 가능
    @Default([]) List<FoodLog> foodLogs,
    @Default([]) List<HealthLog> healthLogs,
  }) = _TimelineItem;

  factory TimelineItem.fromJson(Map<String, dynamic> json) =>
      _$TimelineItemFromJson(json);

  // ✅ 통합 리스트 생성 및 정렬 Getter
  List<Log> get logs {
    // 1. 음식 로그 변환
    final foods = foodLogs.map(
      (e) => Log(
        type: TimelineLogType.food,
        sequence: e.sequence,
        groupUuid: e.groupUuid,
        recordDate: e.recordDate,
        foodName: e.foodName,
        calories: e.calories,
      ),
    );

    // 2. 건강 로그 변환
    final healths = healthLogs.map(
      (e) => Log(
        type: TimelineLogType.health,
        sequence: e.sequence,
        groupUuid: e.groupUuid,
        recordDate: e.recordDate,
        healthType: e.healthType,
        healthValue: e.healthValue,
        healthExtraValue: e.healthExtraValue,
      ),
    );

    // 3. 합치기
    final allLogs = [...foods, ...healths];

    // 4. 최신순 정렬 (내림차순)
    // b.compareTo(a) 하면 내림차순이 됩니다.
    allLogs.sort((a, b) => b.recordDate.compareTo(a.recordDate));

    return allLogs;
  }
}

@freezed
abstract class Log with _$Log {
  factory Log({
    required TimelineLogType type,
    required int sequence,
    required String groupUuid,
    required DateTime recordDate,
    String? foodName,
    double? calories,
    HealthLogType? healthType,
    double? healthValue,
    double? healthExtraValue,
  }) = _Log;
}

/// 2. 음식 기록 (FoodLog)
@freezed
abstract class FoodLog with _$FoodLog {
  factory FoodLog({
    required int sequence,
    required String foodName,
    required double calories, // int, double 호환
    required DateTime recordDate,
    required String groupUuid,
  }) = _FoodLog;

  factory FoodLog.fromJson(Map<String, dynamic> json) =>
      _$FoodLogFromJson(json);
}

/// 3. 건강 기록 (HealthLog)
@freezed
abstract class HealthLog with _$HealthLog {
  factory HealthLog({
    required int sequence,
    required String groupUuid,
    required HealthLogType healthType,
    required double healthValue,
    required DateTime recordDate,
    double? healthExtraValue,
    String? memo,
  }) = _HealthLog;

  factory HealthLog.fromJson(Map<String, dynamic> json) =>
      _$HealthLogFromJson(json);
}
