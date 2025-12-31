import 'package:app/helpers/commons/pretendard.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:flutter/material.dart';

class DailyHealthLogWidget extends StatelessWidget {
  final HealthLog healthLog;

  const DailyHealthLogWidget({super.key, required this.healthLog});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${context.tr.dailyHealthLogTitle} - ${healthLog.healthType.displayName(context)}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4), // 가독성을 위해 간격 살짝 추가
        Text(
          'Value: ${healthLog.healthValue.toStringAsFixed(1)}',
          style: const TextStyle(fontSize: 14),
        ),
        if (healthLog.healthExtraValue != null)
          Text(
            'Extra Value: ${healthLog.healthExtraValue?.toStringAsFixed(1)}',
            style: const TextStyle(fontSize: 14),
          ),
        Text(
          '${context.tr.recordDateText} on ${healthLog.recordDate.toLocal().toString().split(' ')[0]}',
          style: Pretendard.regular(color: Colors.indigo),
        ),
        const Divider(),
      ],
    );
  }
}
