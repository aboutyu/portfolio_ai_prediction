import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_date_model.freezed.dart';
part 'timeline_date_model.g.dart';

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
