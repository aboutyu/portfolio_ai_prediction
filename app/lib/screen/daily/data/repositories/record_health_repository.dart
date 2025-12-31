import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/daily/data/dto/record_health_dto.dart';
import 'package:app/screen/daily/data/dto/timeline_dto.dart';
import 'package:app/screen/daily/data/models/timeline_item.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_health_repository.g.dart';

@riverpod
RecordHealthRepository recordHealthRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return RecordHealthRepository(client);
}

class RecordHealthRepository {
  final CoreApiProvider _client;

  RecordHealthRepository(this._client);

  Future<CoreResponse<List<HealthLog>>> addRecordHealthLog(
    HealthLogType healthType,
    double healthValue,
    double? healthExtraValue,
    String? memo,
    DateTime recordDate,
  ) async {
    final dto = RecordHealthDto(
      healthType: healthType,
      healthValue: healthValue,
      healthExtraValue: healthExtraValue,
      memo: memo,
      recordDate: recordDate,
    );
    final logDto = RecordHealthLogDto(records: [dto]);

    return await _client.request<List<HealthLog>>(
      endpoint: ApiEndpoint.recordHealth,
      dto: logDto,
    );
  }
}
