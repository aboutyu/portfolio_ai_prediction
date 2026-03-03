import 'package:flutter/material.dart';

class HomeRoutineProgressWidget extends StatelessWidget {
  const HomeRoutineProgressWidget({super.key, this.progress = 0.0});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('오늘의 루틴 진행률', style: TextStyle(fontSize: 18, color: Colors.white)),
        SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.white24,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
        SizedBox(height: 4),
        Text(
          '${(progress * 100).toStringAsFixed(1)}%',
          style: TextStyle(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }
}
