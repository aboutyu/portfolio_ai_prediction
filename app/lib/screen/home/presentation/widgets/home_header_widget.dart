import 'package:app/screen/home/presentation/widgets/home_routine_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeaderWidget extends ConsumerStatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  ConsumerState<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends ConsumerState<HomeHeaderWidget> {
  final double progress = 0.65; // 예시 진행률 (65%)

  @override
  Widget build(BuildContext context) {
    // final progress = ref.watch(homeViewModelProvider.select((state) => state.progress));

    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.blueAccent,
      child: HomeRoutineProgressWidget(progress: progress),
    );
  }
}
