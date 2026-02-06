import 'package:app/helpers/extensions/int_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/widgets/text_widgets/health_log_value_widget.dart';
import 'package:flutter/material.dart';

class HealthLogStepWidget extends StatelessWidget {
  const HealthLogStepWidget({super.key, required this.steps});

  final double steps; // 걸음수

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 8.0),
        HealthLogValueWidget(
          value: steps.toInt().toCommaString,
          type: HealthLogValueType.value,
        ),
        const SizedBox(width: 4),
        HealthLogValueWidget(
          value: context.tr.stepcountLogUnitText,
          type: HealthLogValueType.unit,
        ),
      ],
    );
  }
}
