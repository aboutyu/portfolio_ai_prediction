import 'package:app/helpers/enums/daily_quick_menu_type.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/widgets/daily_logs/base_logs_border_widget.dart';
import 'package:app/widgets/daily_logs/base_logs_list_icon_widget.dart';
import 'package:app/widgets/text_widgets/health_log_value_widget.dart';
import 'package:flutter/material.dart';

class DailyFoodLogWidget extends StatelessWidget {
  final FoodLog foodLog;

  const DailyFoodLogWidget({super.key, required this.foodLog});

  @override
  Widget build(BuildContext context) {
    return BaseLogsBorderWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseLogsListIconWidget(
            type: DailyQuickMenuType.meal,
            dateTime: foodLog.recordDate,
          ),

          const SizedBox(height: 4),
          HealthLogValueWidget(
            value: foodLog.foodName,
            type: HealthLogValueType.value,
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              HealthLogValueWidget(
                value: context.tr.foodLogCaloryText,
                type: HealthLogValueType.unit,
              ),
              const SizedBox(width: 4),
              HealthLogValueWidget(
                value: '${foodLog.calories.toStringAsFixed(1)} kcal',
                type: HealthLogValueType.unit,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
