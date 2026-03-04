import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:flutter/material.dart';

class SingleDialogWidget extends BaseDialog {
  final String content;
  final String? title;
  final bool dismissButton;
  final VoidCallback? onConfirm;

  const SingleDialogWidget({
    super.key,
    required this.content,
    this.title,
    this.dismissButton = false,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
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
            onConfirm?.call();
          },
          child: Text(context.tr.dialogConfirmTitle),
        ),
      ],
    );
  }
}
