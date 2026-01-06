import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/screen/notices/data/models/notice_model.dart';
import 'package:app/screen/notices/data/repositories/notice_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notice_view_model.g.dart';

@riverpod
class NoticeViewModel extends _$NoticeViewModel {
  int _page = 0;
  final int _pageNum = defaultPageNum;
  bool _isFetching = false; // 중복 호출 방지 플래그

  @override
  Future<List<NoticeModel>> build() async {
    // 초기화
    _page = 0;
    _isFetching = false;
    return _fetchNotices(0);
  }

  Future<List<NoticeModel>> _fetchNotices(int page) async {
    try {
      final repository = ref.read(noticeRepositoryProvider);
      // defaultPageNum은 상수 파일 등에 정의되어 있다고 가정
      final response = await repository.fetchNoticeList(page, _pageNum);
      return response.data ?? [];
    } catch (e) {
      debugMessage('Error fetching notices: $e');
      rethrow;
    }
  }

  // 스크롤이 바닥에 닿았을 때 호출
  Future<void> loadMore() async {
    if (_isFetching || state.isLoading || state.hasError) return;

    _isFetching = true;

    try {
      final nextPage = _page + 1;
      final newNotices = await _fetchNotices(nextPage);
      _page = nextPage;
      final currentNotices = state.value ?? [];
      state = AsyncValue.data([...currentNotices, ...newNotices]);
    } catch (e) {
      debugMessage('Load more error: $e');
    } finally {
      _isFetching = false;
    }
  }
}
