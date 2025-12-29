import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/daily/data/dto/timeline.dto.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'daily_repository.g.dart';

@riverpod
DailyRepository dailyRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return DailyRepository(client);
}

class DailyRepository {
  final CoreApiProvider _client;

  DailyRepository(this._client);

  Future<CoreResponse<List<TimelineItem>>> fetchDateTimeline(
    int page,
    int pageNum,
    DateTime date,
  ) async {
    final dto = TimelineDto(page: page, pageNum: pageNum, date: date);

    return await _client.request<List<TimelineItem>>(
      endpoint: ApiEndpoint.timelineDate,
      dto: dto,
    );
  }
}
