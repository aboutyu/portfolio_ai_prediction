import 'package:app/widgets/text_widgets/health_log_value_widget.dart';
import 'package:flutter/material.dart';

class HealthLogBpWidget extends StatelessWidget {
  const HealthLogBpWidget({
    super.key,
    required this.systolic,
    required this.diastolic,
  });

  final double systolic; // 수축기
  final double diastolic; // 이완기

  @override
  Widget build(BuildContext context) {
    final text =
        '${diastolic.toStringAsFixed(0)} / ${systolic.toStringAsFixed(0)}';
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 8.0),
        HealthLogValueWidget(value: text, type: HealthLogValueType.value),
        const SizedBox(width: 4),
        HealthLogValueWidget(value: 'mmHg', type: HealthLogValueType.unit),
      ],
    );
  }
}
