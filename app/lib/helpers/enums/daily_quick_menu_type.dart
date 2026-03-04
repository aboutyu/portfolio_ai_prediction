import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

enum DailyQuickMenuType {
  meal, // 식사
  weight, // 체중
  stepCount, // 걸음수
  glucose, // 혈당
  bp, // 혈압
}

extension DailyQuickMenuTypeExtension on DailyQuickMenuType {
  Widget iconWidget(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: icon,
    );
  }

  Icon get icon {
    switch (this) {
      case DailyQuickMenuType.meal:
        return Icon(Icons.restaurant, color: Colors.green);
      case DailyQuickMenuType.weight:
        return Icon(Icons.monitor_weight, color: Colors.blue);
      case DailyQuickMenuType.stepCount:
        return Icon(Icons.directions_walk, color: Colors.teal);
      case DailyQuickMenuType.glucose:
        return Icon(Icons.water_drop, color: Colors.red);
      case DailyQuickMenuType.bp:
        return Icon(Icons.favorite, color: Colors.pink);
    }
  }

  String displayName(BuildContext context) {
    switch (this) {
      case DailyQuickMenuType.meal:
        return context.tr.dailyFloatingFoodText;
      case DailyQuickMenuType.weight:
        return context.tr.dailyFloatingWeightText;
      case DailyQuickMenuType.stepCount:
        return context.tr.dailyFloatingStepcountText;
      case DailyQuickMenuType.glucose:
        return context.tr.dailyFloatingBloodGlucoseText;
      case DailyQuickMenuType.bp:
        return context.tr.dailyFloatingBloodPressureText;
    }
  }
}
