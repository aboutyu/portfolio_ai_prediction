import 'package:app/helpers/commons/colors.dart';
import 'package:flutter/material.dart';

enum HealthLogValueType { value, unit }

class HealthLogValueWidget extends StatelessWidget {
  const HealthLogValueWidget({
    super.key,
    required this.value,
    required this.type,
  });

  final String value; // 측정값
  final HealthLogValueType type;

  @override
  Widget build(BuildContext context) {
    return type == HealthLogValueType.value ? _valueWidget() : _unitWidget();
  }

  Widget _valueWidget() {
    return Text(
      value,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: dailyLogValueTextColor,
      ),
    );
  }

  Widget _unitWidget() {
    return Text(
      value,
      style: TextStyle(
        fontSize: 16,
        color: dailyLogUnitTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
