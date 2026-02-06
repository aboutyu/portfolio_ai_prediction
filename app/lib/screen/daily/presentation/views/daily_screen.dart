import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/enums/daily_quick_menu_type.dart';
import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/helpers/extensions/buildcontext_extension.dart';
import 'package:app/helpers/extensions/datetime_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/daily/presentation/view_models/daily_view_model.dart';
import 'package:app/screen/daily/presentation/views/record_bloodglucose_screen.dart';
import 'package:app/screen/daily/presentation/views/record_bloodpressure_screen.dart';
import 'package:app/screen/daily/presentation/views/record_stepcount_screen.dart';
import 'package:app/screen/daily/presentation/views/record_weight_screen.dart';
import 'package:app/screen/daily/presentation/widgets/daily_expandable_fab_widget.dart';
import 'package:app/widgets/appbar_widgets/appbar_calendar_widget.dart';
import 'package:app/widgets/daily_logs/base_logs_widget.dart';
import 'package:app/widgets/list_widgets/no_item_widget.dart';
import 'package:app/widgets/show_dialogs/base_dialog.dart';
import 'package:app/widgets/show_dialogs/single_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DailyScreen extends ConsumerStatefulWidget {
  const DailyScreen({super.key});

  @override
  ConsumerState<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends ConsumerState<DailyScreen> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();

    _bannerAd = BannerAd(
      adUnitId: AppConfig.admob.adaptiveBanner,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  // 광고 위젯을 생성하는 헬퍼 메서드
  Widget _buildAdWidget() {
    if (!_isLoaded || _bannerAd == null) return const SizedBox.shrink();

    return Container(
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 16.0), // 리스트 아이템과 간격
      child: AdWidget(ad: _bannerAd!),
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(dailyDateProvider);
    final logsResponse = ref.watch(dailyViewModelProvider);

    // 광고 표시 여부 확인
    final showAd = _isLoaded && _bannerAd != null;

    return Scaffold(
      appBar: AppbarCalendarWidget(
        title: '${context.tr.dailyAppbarText}(${selectedDate.forMonthDay})',
        date: selectedDate,
        onDateSelected: (DateTime selectedDate) async =>
            _fetchDailyTimeline(context, ref, selectedDate),
      ),
      body: logsResponse.draws(
        data: (logs) {
          if (logs.isEmpty) {
            return _noItemWidget(showAd);
          }

          // 데이터가 있을 때 (ListView.builder 사용)
          return ListView.builder(
            // 광고가 있으면 아이템 개수 + 1
            itemCount: logs.length + (showAd ? 1 : 0),
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (context, index) {
              if (showAd) {
                // 첫 번째 인덱스(0)는 광고 표시
                if (index == 0) {
                  return _buildAdWidget();
                }
                return BaseLogsWidget(data: logs[index - 1]);
              }
              return BaseLogsWidget(data: logs[index]);
            },
          );
        },
      ),
      floatingActionButton: _fabWidget(),
    );
  }

  Widget _fabWidget() {
    return DailyExpandableFabWidget(
      onSelected: (DailyQuickMenuType type) async {
        switch (type) {
          case DailyQuickMenuType.weight:
            await _showHealthInputDialog(context, ref, HealthLogType.WGT);
            break;
          case DailyQuickMenuType.stepCount:
            await _showHealthInputDialog(context, ref, HealthLogType.SCT);
            break;
          case DailyQuickMenuType.glucose:
            await _showHealthInputDialog(context, ref, HealthLogType.BGT);
            break;
          case DailyQuickMenuType.bp:
            await _showHealthInputDialog(context, ref, HealthLogType.BPT);
            break;
          case DailyQuickMenuType.meal:
            final DateTime? resultDate = await context.push('/record/food');
            await _refreshList(ref, resultDate);
            break;
        }
      },
    );
  }

  Widget _noItemWidget(bool showAd) {
    final itemWidget = NoItemWidget();
    if (showAd) {
      return ListView(
        padding: const EdgeInsets.all(16.0),
        children: [_buildAdWidget(), const SizedBox(height: 50), itemWidget],
      );
    }
    return itemWidget;
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
    await _refreshList(ref, resultDate);
  }

  Future<void> _refreshList(WidgetRef ref, DateTime? resultDate) async {
    if (resultDate == null) return;
    try {
      await ref.read(dailyDateProvider.notifier).update(resultDate);
      ref.invalidate(dailyViewModelProvider);
    } catch (e) {
      await context.showTryCatchErrorDialog(e);
    }
  }
}
