import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

enum RecordButtonType { close, save, delete }

class RecordButtonWidget extends StatelessWidget {
  RecordButtonWidget({
    super.key,
    this.isDeleted = false,
    required this.onTapped,
  });

  final bool isDeleted;
  final void Function(RecordButtonType type) onTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 닫기 버튼
        Expanded(
          child: OutlinedButton(
            onPressed: () => onTapped(RecordButtonType.close),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              side: const BorderSide(color: Colors.grey),
            ),
            child: Text(
              context.tr.dialogClosedTitle,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(width: 10),

        if (isDeleted) ...[
          // 삭제 버튼
          Expanded(
            child: ElevatedButton(
              onPressed: () => onTapped(RecordButtonType.delete),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, // 포인트 컬러
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                context.tr.dialogDeleteTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],

        // 저장 버튼
        Expanded(
          child: ElevatedButton(
            onPressed: () => onTapped(RecordButtonType.save),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, // 포인트 컬러
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: Text(
              context.tr.dialogSavedTitle,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
