import 'package:flutter/material.dart';

class RecordTitleWidget extends StatelessWidget {
  const RecordTitleWidget({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}
