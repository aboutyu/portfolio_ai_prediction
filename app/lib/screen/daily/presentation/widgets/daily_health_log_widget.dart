import 'package:app/helpers/commons/pretendard.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:flutter/material.dart';

// 추후 HealthType 타입별로 다른 UI를 보여주기 위해 수정 필요
Widget DailyHealthLogWidget(
  BuildContext context,
  int sequence,
  HealthLogType? healthType,
  double? healthValue,
  double? healthExtraValue,
  DateTime? recordDate,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${context.tr.dailyHealthLogTitle} - ${healthType?.displayName(context) ?? 'N/A'}',
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      Text(
        'Value: ${healthValue?.toStringAsFixed(2) ?? 'N/A'}',
        style: const TextStyle(fontSize: 14),
      ),
      if (healthExtraValue != null)
        Text(
          'Extra Value: ${healthExtraValue.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 14),
        ),
      Text(
        '${context.tr.recordDateText} on ${recordDate?.toLocal().toString().split(' ')[0]}',
        style: Pretendard.regular(color: Colors.indigo),
      ),
      const Divider(),
    ],
  );
}



// "sequence": 3,
// "groupUuid": "fa29a4a4-46f8-438d-b530-15f9e5c728ee",
// "healthType": "SCT",
// "healthValue": 122,
// "healthExtraValue": null,
// "recordDate": "2024-06-01T12:00:00.000Z"