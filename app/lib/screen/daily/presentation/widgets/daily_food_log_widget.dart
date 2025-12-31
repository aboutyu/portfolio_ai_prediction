import 'package:app/helpers/commons/pretendard.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:flutter/material.dart';

class DailyFoodLogWidget extends StatelessWidget {
  final FoodLog foodLog;

  const DailyFoodLogWidget({super.key, required this.foodLog});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr.dailyFoodLogTitle,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4), // 텍스트 간격 살짝 추가 (선택사항)
        Text(
          '${foodLog.sequence}. ${foodLog.foodName}', // null일 경우 빈 문자열 처리
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          'Calories: ${foodLog.calories.toStringAsFixed(1)} kcal',
          style: const TextStyle(fontSize: 14),
        ),
        Text(
          '${context.tr.recordDateText} on ${foodLog.recordDate.toLocal().toString().split(' ')[0]}',
          style: Pretendard.regular(color: Colors.indigo),
        ),
        const Divider(),
      ],
    );
  }
}
