import 'package:app/helpers/commons/pretendard.dart';
import 'package:app/helpers/enums/daily_quick_menu_type.dart';
import 'package:app/helpers/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';

class BaseLogsListIconWidget extends StatelessWidget {
  const BaseLogsListIconWidget({
    super.key,
    required this.type,
    required this.dateTime,
  });

  final DailyQuickMenuType type;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        type.iconWidget(40),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            type.displayName(context),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          dateTime.toLocal().forHourMinute,
          style: Pretendard.regular(color: Colors.indigo),
        ),
      ],
    );
  }
}
