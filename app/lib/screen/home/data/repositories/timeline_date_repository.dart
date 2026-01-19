import 'package:app/helpers/dto/base_page_request.dto.dart';
import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/home/data/models/timeline_date_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timeline_date_repository.g.dart';

@riverpod
TimelineDateRepository timelineDateRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return TimelineDateRepository(client);
}

class TimelineDateRepository {
  final CoreApiProvider _client;

  TimelineDateRepository(this._client);

  Future<CoreResponse<List<TimelineDate>>> fetchTimeline(
    int page,
    int pageNum,
  ) async {
    final dto = BasePageRequestDto(page: page, pageNum: pageNum);
    return await _client.request<List<TimelineDate>>(
      endpoint: ApiEndpoint.timelineListDate,
      parameters: dto.toJson(),
    );
  }
}
