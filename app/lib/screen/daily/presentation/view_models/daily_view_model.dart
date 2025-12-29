import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:app/screen/daily/data/repositories/daily_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'daily_view_model.g.dart';

@riverpod
class DailyViewModel extends _$DailyViewModel {
  @override
  Future<List<Log>> build() async {
    final selectedDate = ref.watch(dailyDateProvider);
    return fetchDateTimeline(dateTime: selectedDate);
  }

  Future<List<Log>> fetchDateTimeline({
    int page = 0,
    int pageNum = 20,
    DateTime? dateTime,
  }) async {
    try {
      final DateTime date = dateTime ?? DateTime.now();

      final repository = ref.read(dailyRepositoryProvider);
      final response = await repository.fetchDateTimeline(page, pageNum, date);

      if (response.data == null || response.data!.isEmpty) {
        return [];
      }

      return response.data!.expand((item) => item.logs).toList();
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

// 날짜 상태를 관리하는 Provider
@riverpod
class DailyDate extends _$DailyDate {
  @override
  DateTime build() {
    return DateTime.now(); // 초기값: 오늘 날짜
  }

  // 날짜 변경 함수
  Future<void> update(DateTime newDate) async {
    state = newDate;
    debugMessage('선택된 날짜: $state');
  }
}
