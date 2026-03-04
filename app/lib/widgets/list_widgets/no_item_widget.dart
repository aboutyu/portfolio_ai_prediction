import 'package:app/helpers/commons/pretendard.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';

class NoItemWidget extends StatelessWidget {
  const NoItemWidget({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? context.tr.dailyNoLogsText,
        style: Pretendard.extraBold(size: 16, color: Colors.redAccent),
      ),
    );
  }
}
