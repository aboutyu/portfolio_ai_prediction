import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeRoutineProgressWidget extends ConsumerWidget {
  const HomeRoutineProgressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final progress = ref.watch(homeViewModelProvider.select((state) => state.progress));
    final progress = 0.90; // 임시로 75% 진행률을 표시

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                context.tr.todayRoutineProgressText,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Spacer(),
              Text(
                '${(progress * 100).toStringAsFixed(1)}%',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white24,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
