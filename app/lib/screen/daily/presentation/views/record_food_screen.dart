import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordFoodScreen extends ConsumerWidget {
  const RecordFoodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('음식 기록')),
      body: Center(child: Text('음식 기록 화면 내용')),
    );
  }
}
