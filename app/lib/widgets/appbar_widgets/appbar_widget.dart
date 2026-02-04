import 'package:app/helpers/commons/pretendard.dart';
import 'package:flutter/material.dart';

Text appBarText(String text) {
  return Text(text, style: Pretendard.semiBold(size: 18, color: Colors.black));
}

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: appBarText(title), actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
