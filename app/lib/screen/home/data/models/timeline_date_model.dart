import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 필수: 파일명과 동일하게 맞춰주세요 (예: timeline_model.dart)
part 'timeline_date_model.freezed.dart';
part 'timeline_date_model.g.dart';

/// 날짜별 그룹핑된 타임라인 아이템 (Card 1개 단위)
@freezed
abstract class TimelineDate with _$TimelineDate {
  const factory TimelineDate({
    required String recordDate, // "2026-01-19"
    String? memo,
    @Default([]) List<FoodLog> foodLogs,
    @Default([]) List<HealthLog> healthLogs,
  }) = _TimelineDate;

  factory TimelineDate.fromJson(Map<String, dynamic> json) =>
      _$TimelineDateFromJson(json);
}
