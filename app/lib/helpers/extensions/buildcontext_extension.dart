import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  void safePop<T>([T? result]) {
    debugMessage('$mounted Attempting to pop navigation with result: $result');
    if (!mounted) return;
    pop(result);
  }
}

extension DialogExtension on BuildContext {
  Future<void> showTryCatchErrorDialog(Object e) async {
    debugMessage(['오류 발생(showTryCatchErrorDialog)', e.toString()]);
    if (!mounted) return;
    await SingleDialogWidget(
      content: tr.tryCatchErrorText(e.toString()),
      onConfirm: null,
    ).show(this);
  }
}
