import 'package:app/widgets/text_widgets/health_log_value_widget.dart';
import 'package:flutter/material.dart';

class HealthLogWeightWidget extends StatelessWidget {
  const HealthLogWeightWidget({super.key, required this.weight});

  final double weight; // 체중

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 8.0),
        HealthLogValueWidget(
          value: weight.toStringAsFixed(1),
          type: HealthLogValueType.value,
        ),
        const SizedBox(width: 4),
        HealthLogValueWidget(value: 'kg', type: HealthLogValueType.unit),
      ],
    );
  }
}
