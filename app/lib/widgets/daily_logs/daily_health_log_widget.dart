import 'package:app/helpers/commons/pretendard.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/widgets/daily_logs/base_logs_border_widget.dart';
import 'package:flutter/material.dart';

class DailyHealthLogWidget extends StatelessWidget {
  final HealthLog healthLog;

  const DailyHealthLogWidget({super.key, required this.healthLog});

  @override
  Widget build(BuildContext context) {
    return BaseLogsBorderWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${context.tr.dailyHealthLogTitle} - ${healthLog.healthType.displayName(context)}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
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
        ],
      ),
    );

    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(
    //       '${context.tr.dailyHealthLogTitle} - ${healthLog.healthType.displayName(context)}',
    //       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    //     ),
    //     const SizedBox(height: 4), // 가독성을 위해 간격 살짝 추가
    //     Text(
    //       'Value: ${healthLog.healthValue.toStringAsFixed(1)}',
    //       style: const TextStyle(fontSize: 14),
    //     ),
    //     if (healthLog.healthExtraValue != null)
    //       Text(
    //         'Extra Value: ${healthLog.healthExtraValue?.toStringAsFixed(1)}',
    //         style: const TextStyle(fontSize: 14),
    //       ),
    //     Text(
    //       '${context.tr.recordDateText} on ${healthLog.recordDate.toLocal().toString().split(' ')[0]}',
    //       style: Pretendard.regular(color: Colors.indigo),
    //     ),
    //   ],
    // );
  }

  // 수정 기능 추가해야 함
  // Widget _healthLogWidget(HealthLog data) {
  // return GestureDetector(
  //   onTap: () async {
  //     // 3. 요청하신 다이얼로그 코드 삽입
  //     final resultDate = await showDialog(
  //       context: context,
  //       barrierDismissible: true,
  //       builder: (BuildContext context) {
  //         return Dialog(
  //           insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(16.0),
  //           ),
  //           clipBehavior: Clip.hardEdge,
  //           // 4. healthType에 따라 다른 화면 보여주기 (현재는 모두 같은 화면으로 설정됨)
  //           child: switch (data.healthType) {
  //             HealthLogType.WGT => RecordWeightDetailScreen(
  //               healthLog: data,
  //             ),
  //             HealthLogType.SCT => RecordStepcountDetailScreen(
  //               healthLog: data,
  //             ),
  //             HealthLogType.BGT => RecordBloodGlucoseDetailScreen(
  //               healthLog: data,
  //             ),
  //             HealthLogType.BPT => RecordBloodpressureDetailScreen(
  //               healthLog: data,
  //             ),
  //           },
  //         );
  //       },
  //     );

  //     // 화면 갱신
  //     await _refreshList(ref, context, resultDate);
  //   },
  //   // 기존 위젯 표시
  //   child: DailyHealthLogWidget(healthLog: data),
  // );
  // }
}
