import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/screen/home/data/models/timeline_date_model.dart';
import 'package:app/screen/home/data/repositories/timeline_date_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  Future<List<TimelineDate>> build() async {
    return fetchTimeline();
  }

  Future<List<TimelineDate>> fetchTimeline({
    int page = 0,
    int pageNum = 10,
  }) async {
    try {
      final repository = ref.read(timelineDateRepositoryProvider);
      final response = await repository.fetchTimeline(page, pageNum);

      if (response.data == null || response.data!.isEmpty) {
        return [];
      }

      return response.data!;
    } catch (e) {
      debugMessage('Error fetching timeline: $e');
      rethrow;
    }
  }

  // build()를 다시 실행시켜서 데이터를 갱신함
  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
