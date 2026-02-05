import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/widgets/daily_logs/daily_food_log_widget.dart';
import 'package:app/widgets/daily_logs/daily_health_log_widget.dart';
import 'package:flutter/material.dart';

class BaseLogsWidget extends StatefulWidget {
  const BaseLogsWidget({super.key, required this.data});

  final Log data;

  @override
  State<BaseLogsWidget> createState() => _BaseLogsWidgetState();
}

class _BaseLogsWidgetState extends State<BaseLogsWidget> {
  Log get _data => widget.data;

  @override
  Widget build(BuildContext context) {
    return _logWidget(_data);
  }

  Widget _logWidget(Log data) {
    if (data.type == TimelineLogType.food) {
      return DailyFoodLogWidget(
        foodLog: FoodLog(
          sequence: data.sequence,
          foodName: data.foodName ?? '',
          calories: data.calories ?? 0.0,
          recordDate: data.recordDate,
          groupUuid: data.groupUuid,
        ),
      );
    }

    if (data.type == TimelineLogType.health && data.healthType == null) {
      return const SizedBox.shrink();
    }

    final healthLogData = HealthLog(
      sequence: data.sequence,
      groupUuid: data.groupUuid,
      healthType: data.healthType!,
      healthValue: data.healthValue ?? 0.0,
      healthExtraValue: data.healthExtraValue,
      recordDate: data.recordDate,
    );
    return DailyHealthLogWidget(healthLog: healthLogData);
  }
}
