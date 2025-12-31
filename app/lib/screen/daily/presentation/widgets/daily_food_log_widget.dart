import 'package:app/helpers/commons/pretendard.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

Widget DailyFoodLogWidget(
  BuildContext context,
  int sequence,
  String? foodName,
  double? calories,
  DateTime recordDate,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        context.tr.dailyFoodLogTitle,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        '$sequence. $foodName',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Calories: ${calories?.toStringAsFixed(2) ?? 'N/A'} kcal',
        style: const TextStyle(fontSize: 14),
      ),
      Text(
        '${context.tr.recordDateText} on ${recordDate.toLocal().toString().split(' ')[0]}',
        style: Pretendard.regular(color: Colors.indigo),
      ),
      const Divider(),
    ],
  );
}
