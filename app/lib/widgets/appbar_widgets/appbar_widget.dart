import 'package:app/helpers/commons/pretendard.dart';
import 'package:flutter/material.dart';

AppBar appBarWidget(String title) {
  return AppBar(
    title: appBarText(title),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 1,
  );
}

Text appBarText(String text) {
  return Text(text, style: Pretendard.semiBold(size: 18, color: Colors.black));
}
