import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/extensions/l10n.extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/daily/presentation/view_models/daily_view_model.dart';
import 'package:app/screen/daily/presentation/widgets/daily_food_log_widget.dart';
import 'package:app/screen/daily/presentation/widgets/daily_health_log_widget.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:app/widgets/list_widgets/no_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DailyScreen extends ConsumerWidget {
  const DailyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dailyDateProvider);
    final logsResponse = ref.watch(dailyViewModelProvider);

    return Scaffold(
      appBar: appBarWidgetCalendar(
        context,
        context.tr.dailyAppbarText,
        selectedDate,
        (DateTime selectedDate) async =>
            _fetchDailyTimeline(context, ref, selectedDate),
      ),
      body: logsResponse.when(
        data: (logs) {
          if (logs.isEmpty) return noItemWidget(context);

          return ListView.builder(
            itemCount: logs.length,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              final log = logs[index];

              switch (log.type) {
                case TimelineLogType.health:
                  return DailyHealthLogWidget(
                    context,
                    log.sequence,
                    log.healthType,
                    log.healthValue,
                    log.healthExtraValue,
                    log.recordDate,
                  );

                case TimelineLogType.food:
                  return DailyFoodLogWidget(
                    context,
                    log.sequence,
                    log.foodName,
                    log.calories,
                    log.recordDate,
                  );
              }
            },
          );
        },
        error: (err, stack) => Center(child: Text('에러: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  void _fetchDailyTimeline(
    BuildContext context,
    WidgetRef ref,
    DateTime selectedDate,
  ) async {
    await ref.read(dailyDateProvider.notifier).update(selectedDate);
    try {
      final response = await ref
          .read(dailyViewModelProvider.notifier)
          .fetchDateTimeline(dateTime: selectedDate);
      debugMessage('타임라인 데이터: $response');
    } catch (e) {
      debugMessage('타임라인 데이터 불러오기 실패: $e');
    }
  }
}
