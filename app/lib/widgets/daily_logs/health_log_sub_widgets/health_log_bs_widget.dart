import 'package:app/widgets/text_widgets/health_log_value_widget.dart';
import 'package:flutter/material.dart';

class HealthLogBsWidget extends StatelessWidget {
  const HealthLogBsWidget({super.key, required this.bs});

  final double bs; // 혈당

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 8.0),
        HealthLogValueWidget(
          value: bs.toStringAsFixed(0),
          type: HealthLogValueType.value,
        ),
        const SizedBox(width: 4),
        HealthLogValueWidget(value: 'mg/dL', type: HealthLogValueType.unit),
      ],
    );
  }
}
