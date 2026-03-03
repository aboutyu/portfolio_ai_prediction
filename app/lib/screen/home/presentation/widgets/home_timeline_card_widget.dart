import 'package:app/helpers/enums/daily_quick_menu_type.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/home/data/models/timeline_date_model.dart';
import 'package:flutter/material.dart';

class HomeTimelineCardWidget extends StatelessWidget {
  const HomeTimelineCardWidget({super.key, required this.timelineItem});

  final TimelineDate timelineItem;

  @override
  Widget build(BuildContext context) {
    final foodCount = timelineItem.foodLogs.length;

    final healthCounts = <HealthLogType, int>{};
    for (var log in timelineItem.healthLogs) {
      healthCounts[log.healthType] = (healthCounts[log.healthType] ?? 0) + 1;
    }

    return Row(
      children: [
        Expanded(
          child: Card(
            margin: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    timelineItem.recordDate,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 💡 다이나믹하게 칩을 생성하는 Wrap 영역
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      if (foodCount > 0)
                        _buildChip(
                          DailyQuickMenuType.meal.iconWidget(6),
                          'Food',
                          foodCount,
                        ),

                      // 건강 기록 칩 (등록된 타입만 필터링하여 렌더링)
                      ...HealthLogType.values
                          .where((type) => (healthCounts[type] ?? 0) > 0)
                          .map((type) {
                            final count = healthCounts[type]!;
                            return _buildChip(
                              type.toDailyQuickMenuType.iconWidget(6),
                              type.displayName(context),
                              count,
                            );
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChip(Widget icon, String name, int label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 6),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue[700],
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '$label',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.blue[700],
            ),
          ),
        ],
      ),
    );
  }
}
