import 'package:app/screen/home/presentation/widgets/home_routine_object_widget.dart';
import 'package:app/screen/home/presentation/widgets/home_routine_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeHeaderWidget extends ConsumerStatefulWidget {
  const HomeHeaderWidget({super.key});

  @override
  ConsumerState<HomeHeaderWidget> createState() => _HomeHeaderWidgetState();
}

class _HomeHeaderWidgetState extends ConsumerState<HomeHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeRoutineObjectWidget(),
          const SizedBox(height: 12),
          HomeRoutineProgressWidget(),
        ],
      ),
    );
  }
}
