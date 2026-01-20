import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/home/data/models/timeline_date_model.dart';
import 'package:app/screen/home/presentation/view_models/home_view_model.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timelines_plus/timelines_plus.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timelines = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppbarWidget(title: context.tr.homeNavigationText),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Timeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            connectorTheme: const ConnectorThemeData(
              color: Colors.grey,
              thickness: 2.0,
            ),
            indicatorTheme: const IndicatorThemeData(
              size: 20.0,
              color: Colors.blue,
            ),
          ),
          builder: TimelineTileBuilder.fromStyle(
            contentsAlign: ContentsAlign.basic,
            connectorStyle: ConnectorStyle.solidLine,
            indicatorStyle: IndicatorStyle.dot,
            contentsBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
                top: 6.0,
                bottom: 6.0,
              ),
              child: _timelineCardWidget(timelines.value![index]),
            ),
            itemCount: timelines.value?.length ?? 0,
          ),
        ),
      ),
    );
  }

  Widget _timelineCardWidget(TimelineDate timelineItem) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              timelineItem.recordDate,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Memo: ${timelineItem.memo ?? "-"}'),
            const SizedBox(height: 8),
            Text('Food: ${timelineItem.foodLogs.length} items'),
            const SizedBox(height: 8),
            Text('Health: ${timelineItem.healthLogs.length} items'),
          ],
        ),
      ),
    );
  }
}
