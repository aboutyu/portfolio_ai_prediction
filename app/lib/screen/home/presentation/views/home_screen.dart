import 'package:app/screen/home/presentation/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timelines = ref.watch(homeViewModelProvider);

    return Scaffold(body: Center(child: const Text('Home Screen')));
  }
}
