import 'package:app/helpers/commons/pretendard.dart';
import 'package:app/helpers/enums/daily_quick_menu_type.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/widgets/daily_logs/base_logs_border_widget.dart';
import 'package:app/widgets/daily_logs/base_logs_list_icon_widget.dart';
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
          Text(
            foodLog.foodName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            'Calories: ${foodLog.calories.toStringAsFixed(1)} kcal',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
