import 'package:app/helpers/dto/base_page_request.dto.dart';
import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/notices/data/models/notice_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notice_repository.g.dart';

@riverpod
NoticeRepository noticeRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return NoticeRepository(client);
}

class NoticeRepository {
  final CoreApiProvider _client;

  NoticeRepository(this._client);

  Future<CoreResponse<List<NoticeModel>>> fetchNoticeList(
    int page,
    int pageNum,
  ) async {
    final dto = BasePageRequestDto(page: page, pageNum: pageNum);

    return await _client.request<List<NoticeModel>>(
      endpoint: ApiEndpoint.noticeList,
      dto: dto,
    );
  }
}
