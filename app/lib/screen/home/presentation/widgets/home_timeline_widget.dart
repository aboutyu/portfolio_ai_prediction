import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/screen/home/data/models/timeline_date_model.dart';
import 'package:app/screen/home/presentation/view_models/home_view_model.dart';
import 'package:app/screen/home/presentation/widgets/home_timeline_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timelines_plus/timelines_plus.dart';

class HomeTimelineWidget extends ConsumerWidget {
  const HomeTimelineWidget({super.key});

  TimelineThemeData get _theme => TimelineThemeData(
    nodePosition: 0,
    connectorTheme: const ConnectorThemeData(
      color: Colors.grey,
      thickness: 2.0,
    ),
    indicatorTheme: const IndicatorThemeData(size: 20.0, color: Colors.grey),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timelines = ref.watch(homeViewModelProvider);

    return timelines.draws(
      data: (timelineDates) => FixedTimeline.tileBuilder(
        theme: _theme,
        builder: _tileBuilder(timelineDates),
      ),
    );
  }

  TimelineTileBuilder _tileBuilder(List<TimelineDate> timelineDates) {
    return TimelineTileBuilder.fromStyle(
      contentsAlign: ContentsAlign.basic,
      connectorStyle: ConnectorStyle.solidLine,
      indicatorStyle: IndicatorStyle.outlined,
      itemCount: timelineDates.length,
      contentsBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 10,
          top: 8.0,
          bottom: 8.0,
        ),
        child: HomeTimelineCardWidget(timelineItem: timelineDates[index]),
      ),
    );
  }
}
