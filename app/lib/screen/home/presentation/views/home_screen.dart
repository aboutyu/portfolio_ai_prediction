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
      body: Timeline.tileBuilder(
        builder: TimelineTileBuilder.fromStyle(
          contentsAlign: ContentsAlign.alternating,

          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: _timelineCardWidget(timelines.value![index]),
          ),
          itemCount: timelines.value?.length ?? 0,
        ),
      ),
    );
  }

  Widget _timelineCardWidget(TimelineDate timelineItem) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
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
