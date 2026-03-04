import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/widgets/daily_logs/base_logs_border_widget.dart';
import 'package:app/widgets/daily_logs/base_logs_list_icon_widget.dart';
import 'package:app/widgets/daily_logs/health_log_sub_widgets/health_log_bp_widget.dart';
import 'package:app/widgets/daily_logs/health_log_sub_widgets/health_log_bs_widget.dart';
import 'package:app/widgets/daily_logs/health_log_sub_widgets/health_log_step_widget.dart';
import 'package:app/widgets/daily_logs/health_log_sub_widgets/health_log_weight_widget.dart';
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
          BaseLogsListIconWidget(
            type: healthLog.healthType.toDailyQuickMenuType,
            dateTime: healthLog.recordDate,
          ),
          const SizedBox(height: 4),
          _healthLogWidget(healthLog),
        ],
      ),
    );
  }

  Widget _healthLogWidget(HealthLog data) {
    final healthType = data.healthType;
    final value = data.healthValue;
    final extra = data.healthExtraValue;

    if (healthType == HealthLogType.WGT) {
      // 체중
      return HealthLogWeightWidget(weight: value);
    } else if (healthType == HealthLogType.BPT && extra != null) {
      // 혈압
      return HealthLogBpWidget(systolic: value, diastolic: extra);
    } else if (healthType == HealthLogType.SCT) {
      // 걸음수
      return HealthLogStepWidget(steps: value);
    } else if (healthType == HealthLogType.BGT) {
      // 혈당
      return HealthLogBsWidget(bs: value);
    } else {
      return const SizedBox.shrink();
    }
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
