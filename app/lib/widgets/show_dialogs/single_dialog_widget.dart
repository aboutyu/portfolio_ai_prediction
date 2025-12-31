import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

Widget singleDialogWidget(
  BuildContext context,
  String content, {
  String? title,
  bool dismissButton = false,
  VoidCallback? onConfirm,
}) {
  return AlertDialog(
    title: title != null ? Text(title) : null,
    content: Text(content),
    actions: [
      if (dismissButton)
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(context.tr.dialogCancelTitle),
        ),
      ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
          if (onConfirm != null) {
            onConfirm();
          }
        },
        child: Text(context.tr.dialogConfirmTitle),
      ),
    ],
  );
}
