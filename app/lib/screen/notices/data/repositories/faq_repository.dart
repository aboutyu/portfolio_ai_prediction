import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/notices/data/dto/faq_dto.dart';
import 'package:app/screen/notices/data/models/faq_category_model.dart';
import 'package:app/screen/notices/data/models/notice_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faq_repository.g.dart';

@riverpod
FaqRepository faqRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return FaqRepository(client);
}

class FaqRepository {
  final CoreApiProvider _client;

  FaqRepository(this._client);

  Future<CoreResponse<List<NoticeModel>>> fetchFaqList(
    int page,
    int pageNum,
    NoticeFaqType? faqType,
  ) async {
    final dto = FaqDto(page: page, pageNum: pageNum, faqType: faqType);

    return await _client.request<List<NoticeModel>>(
      endpoint: ApiEndpoint.faqList,
      dto: dto,
    );
  }
}

@riverpod
FaqCategoriesRepository faqCategoriesRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return FaqCategoriesRepository(client);
}

class FaqCategoriesRepository {
  final CoreApiProvider _client;

  FaqCategoriesRepository(this._client);

  Future<CoreResponse<List<FaqCategoryModel>>> fetchFaqCategories() async {
    return await _client.request<List<FaqCategoryModel>>(
      endpoint: ApiEndpoint.faqCategoryList,
    );
  }
}
