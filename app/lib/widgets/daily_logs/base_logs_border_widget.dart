import 'package:flutter/material.dart';

class BaseLogsBorderWidget extends StatelessWidget {
  const BaseLogsBorderWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey[300] ?? Colors.grey, width: 1.0),
      ),
      child: child,
    );
  }
}
