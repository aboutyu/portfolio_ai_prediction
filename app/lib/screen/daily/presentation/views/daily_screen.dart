import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/helpers/extensions/buildcontext_extension.dart';
import 'package:app/helpers/extensions/datetime_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/daily/presentation/view_models/daily_view_model.dart';
import 'package:app/screen/daily/presentation/views/record_bloodglucos_detail_screen.dart';
import 'package:app/screen/daily/presentation/views/record_bloodglucose_screen.dart';
import 'package:app/screen/daily/presentation/views/record_bloodpressure_detail_screen.dart';
import 'package:app/screen/daily/presentation/views/record_bloodpressure_screen.dart';
import 'package:app/screen/daily/presentation/views/record_stepcount_detail_screen.dart';
import 'package:app/screen/daily/presentation/views/record_stepcount_screen.dart';
import 'package:app/screen/daily/presentation/views/record_weight_detail_screen.dart';
import 'package:app/screen/daily/presentation/views/record_weight_screen.dart';
import 'package:app/screen/daily/presentation/widgets/daily_expandable_fab_widget.dart';
import 'package:app/screen/daily/presentation/widgets/daily_food_log_widget.dart';
import 'package:app/screen/daily/presentation/widgets/daily_health_log_widget.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:app/widgets/list_widgets/no_item_widget.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DailyScreen extends ConsumerWidget {
  const DailyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dailyDateProvider);
    final logsResponse = ref.watch(dailyViewModelProvider);

    return Scaffold(
      appBar: appBarWidgetCalendar(
        context,
        '${context.tr.dailyAppbarText}(${selectedDate.forMonthDay})',
        selectedDate,
        (DateTime selectedDate) async =>
            _fetchDailyTimeline(context, ref, selectedDate),
      ),
      body: logsResponse.draws(
        data: (logs) {
          if (logs.isEmpty) return noItemWidget(context);

          return ListView.builder(
            itemCount: logs.length,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              final log = logs[index];

              switch (log.type) {
                case TimelineLogType.health:
                  if (log.healthType == null) {
                    return const SizedBox.shrink();
                  }

                  // 1. 다이얼로그와 위젯 양쪽에서 쓰기 위해 객체를 미리 생성
                  final healthLogData = HealthLog(
                    sequence: log.sequence,
                    groupUuid: log.groupUuid,
                    healthType: log.healthType!,
                    healthValue: log.healthValue ?? 0.0,
                    healthExtraValue: log.healthExtraValue,
                    recordDate: log.recordDate,
                  );

                  // 2. 터치 이벤트를 위해 GestureDetector(또는 InkWell)로 감싸기
                  return GestureDetector(
                    onTap: () async {
                      // 3. 요청하신 다이얼로그 코드 삽입
                      final resultDate = await showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return Dialog(
                            insetPadding: const EdgeInsets.symmetric(
                              horizontal: 25.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            clipBehavior: Clip.hardEdge,
                            // 4. healthType에 따라 다른 화면 보여주기 (현재는 모두 같은 화면으로 설정됨)
                            child: switch (healthLogData.healthType) {
                              HealthLogType.WGT => RecordWeightDetailScreen(
                                healthLog: healthLogData,
                              ),
                              HealthLogType.SCT => RecordStepcountDetailScreen(
                                healthLog: healthLogData,
                              ),
                              HealthLogType.BGT =>
                                RecordBloodGlucoseDetailScreen(
                                  healthLog: healthLogData,
                                ),
                              HealthLogType.BPT =>
                                RecordBloodpressureDetailScreen(
                                  healthLog: healthLogData,
                                ),
                            },
                          );
                        },
                      );

                      // 화면 갱신
                      await _refreshList(ref, context, resultDate);
                    },
                    // 기존 위젯 표시
                    child: DailyHealthLogWidget(healthLog: healthLogData),
                  );

                case TimelineLogType.food:
                  return DailyFoodLogWidget(
                    foodLog: FoodLog(
                      sequence: log.sequence,
                      foodName: log.foodName ?? '',
                      calories: log.calories ?? 0.0,
                      recordDate: log.recordDate,
                      groupUuid: log.groupUuid,
                    ),
                  );
              }
            },
          );
        },
      ),
      floatingActionButton: DailyExpandableFabWidget(
        onSelected: (DailyExpandableFabQuickMenuType type) async {
          switch (type) {
            case DailyExpandableFabQuickMenuType.weight:
              await _showHealthInputDialog(context, ref, HealthLogType.WGT);
              break;
            case DailyExpandableFabQuickMenuType.stepCount:
              await _showHealthInputDialog(context, ref, HealthLogType.SCT);
              break;
            case DailyExpandableFabQuickMenuType.glucose:
              await _showHealthInputDialog(context, ref, HealthLogType.BGT);
              break;
            case DailyExpandableFabQuickMenuType.bp:
              await _showHealthInputDialog(context, ref, HealthLogType.BPT);
              break;
            case DailyExpandableFabQuickMenuType.meal:
              context.push('/record/food');
              break;
          }
        },
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
      SingleDialogWidget(
        content: context.tr.tryCatchErrorText(e.toString()),
      ).show(context);
    }
  }

  Future<void> _showHealthInputDialog(
    BuildContext context,
    WidgetRef ref,
    HealthLogType healthType,
  ) async {
    final DateTime? resultDate = await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          clipBehavior: Clip.hardEdge,

          child: switch (healthType) {
            HealthLogType.WGT => const RecordWeightScreen(),
            HealthLogType.SCT => const RecordStepcountScreen(),
            HealthLogType.BGT => const RecordBloodGlucoseScreen(),
            HealthLogType.BPT => const RecordBloodPressureScreen(),
          },
        );
      },
    );
    await _refreshList(ref, context, resultDate);
  }

  Future<void> _refreshList(
    WidgetRef ref,
    BuildContext context,
    DateTime? resultDate,
  ) async {
    if (resultDate == null) return;
    try {
      await ref.read(dailyDateProvider.notifier).update(resultDate);
      ref.invalidate(dailyViewModelProvider);
    } catch (e) {
      await context.showTryCatchErrorDialog(e);
    }
  }
}
