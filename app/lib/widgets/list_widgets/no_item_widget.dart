import 'package:app/helpers/commons/pretendard.dart';
import 'package:app/helpers/extensions/l10n.extension.dart';
import 'package:flutter/material.dart';

Widget noItemWidget(BuildContext context, {String? message}) {
  return Center(
    child: Text(
      message ?? context.tr.dailyNoLogsText,
      style: Pretendard.extraBold(size: 16, color: Colors.redAccent),
    ),
  );
}
