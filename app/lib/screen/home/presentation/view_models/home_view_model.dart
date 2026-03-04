import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/screen/home/data/models/timeline_date_model.dart';
import 'package:app/screen/home/data/repositories/timeline_date_repository.dart';
import 'package:flutter/foundation.dart'; // listEquals를 위해 필요
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  // 기본 페이지 사이즈 정의
  static const int _pageSize = 20;

  @override
  Future<List<TimelineDate>> build() async {
    // 첫 빌드 시에는 기본 50개 혹은 20개 로드
    return fetchTimeline(page: 0, pageNum: 50);
  }

  Future<List<TimelineDate>> fetchTimeline({
    int page = 0,
    int pageNum = 50,
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

  /// 화면 진입 시 호출: 현재 로드된 개수만큼 다시 찔러서 변경사항 확인
  Future<void> checkAndRefresh() async {
    // 1. 현재 로드된 데이터 확인 (데이터가 없으면 기본값으로 fetch)
    final currentList = state.value ?? [];

    // 2. 가져올 개수(pageNum) 계산
    // 현재 0개면 20개, 21개면 40개, 40개면 40개 -> 20 단위로 올림 처리 (User Logic 반영)
    int currentCount = currentList.length;
    int targetPageNum = (currentCount == 0)
        ? _pageSize
        : ((currentCount / _pageSize).ceil() * _pageSize);

    try {
      // 3. API 호출 (Page는 항상 0, 개수는 계산된 값)
      final newList = await fetchTimeline(page: 0, pageNum: targetPageNum);

      // 4. 기존 데이터와 비교 (다를 경우에만 업데이트)
      // 주의: TimelineDate 모델에 == 연산자(Equatable)가 구현되어 있어야 정확히 비교됩니다.
      if (!listEquals(currentList, newList)) {
        debugMessage('Timeline updated detected. Refreshing UI.');
        state = AsyncValue.data(newList);
      } else {
        debugMessage('Timeline is up to date. No changes.');
      }
    } catch (e) {
      // 에러 발생 시 조용히 넘어가거나 에러 처리 (여기선 기존 데이터 유지)
      debugMessage('Failed to check for updates: $e');
    }
  }
}
