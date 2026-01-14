import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/screen/notices/data/models/faq_category_model.dart';
import 'package:app/screen/notices/data/models/notice_model.dart';
import 'package:app/screen/notices/data/repositories/faq_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faq_view_model.g.dart';

@riverpod
class FaqViewModel extends _$FaqViewModel {
  int _page = 0;
  NoticeFaqType? _faqType;
  final int _pageNum = defaultPageNum;
  bool _isFetching = false; // 중복 호출 방지 플래그
  List<FaqCategoryModel> _faqCategory = [];

  @override
  Future<List<NoticeModel>> build() async {
    final categoryList = await _fetchFaqCategory();
    _faqCategory = categoryList;

    // 초기화
    _page = 0;
    _isFetching = false;
    _faqType = null;
    return _fetchFaqs(0);
  }

  Future<List<NoticeModel>> _fetchFaqs(int page) async {
    try {
      debugMessage('Fetching FAQ Category: $_faqCategory');

      final repository = ref.read(faqRepositoryProvider);
      // defaultPageNum은 상수 파일 등에 정의되어 있다고 가정
      final response = await repository.fetchFaqList(page, _pageNum, _faqType);
      final rawList = response.data ?? [];

      // 매칭 로직 추가
      return rawList.map((notice) {
        // _faqCategory에서 같은 faqKind를 가진 카테고리 찾기
        final category = _faqCategory.firstWhere(
          (cat) => cat.faqKind == notice.faqKind,
          orElse: () => const FaqCategoryModel(
            faqKind: NoticeFaqType.unknown,
            faqName: '일반',
          ),
          // unknown은 예시입니다. 적절한 기본값을 설정하세요.
        );

        // copyWith를 사용하여 categoryName이 주입된 새 객체 생성
        return notice.copyWith(categoryName: '[${category.faqName}] ');
      }).toList();
    } catch (e) {
      debugMessage('Error fetching faq: $e');
      rethrow;
    }
  }

  // 스크롤이 바닥에 닿았을 때 호출
  Future<void> loadMore(NoticeFaqType? faqType) async {
    if (_isFetching || state.isLoading || state.hasError) return;

    _isFetching = true;
    _faqType = faqType;

    try {
      final nextPage = _page + 1;
      final newNotices = await _fetchFaqs(nextPage);
      _page = nextPage;
      final currentNotices = state.value ?? [];
      state = AsyncValue.data([...currentNotices, ...newNotices]);
    } catch (e) {
      debugMessage('Load more error: $e');
    } finally {
      _isFetching = false;
    }
  }

  Future<List<FaqCategoryModel>> _fetchFaqCategory() async {
    try {
      final repository = ref.read(faqCategoriesRepositoryProvider);
      final response = await repository.fetchFaqCategories();
      return response.data ?? [];
    } catch (e) {
      debugMessage('Error fetching faq categories: $e');
      rethrow;
    }
  }
}
