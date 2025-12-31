import 'package:app/helpers/extensions/datetime_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

class RecordDateTimeWidget extends StatelessWidget {
  final DateTime selectedDate;
  final bool isChangeable;
  final VoidCallback onTap;

  const RecordDateTimeWidget({
    super.key,
    required this.selectedDate,
    required this.onTap,
    this.isChangeable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${context.tr.inputDateText}: ',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          selectedDate.forYearMonthDay,
          style: const TextStyle(fontSize: 16),
        ),
        if (isChangeable) ...[
          const Spacer(),
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              backgroundColor: Colors.grey[200],
            ),
            child: Text(
              context.tr.dialogChangeTitle,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ],
    );
  }
}
