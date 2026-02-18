import 'package:app/helpers/dto/base_page_request.dto.dart';
import 'package:app/helpers/models/app_update_model.dart';
import 'package:app/helpers/models/service_info_model.dart';
import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/home/data/models/timeline_date_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_initializer_repository.g.dart';

@riverpod
AppInitializerRepository appInitializerRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return AppInitializerRepository(client);
}

class AppInitializerRepository {
  final CoreApiProvider _client;

  AppInitializerRepository(this._client);

  Future<CoreResponse<AppUpdateModel>> fetchAppUpdate() async {
    return await _client.request<AppUpdateModel>(
      endpoint: ApiEndpoint.appUpdate,
    );
  }

  Future<CoreResponse<ServiceInfoModel>> fetchServiceInfo() async {
    return await _client.request<ServiceInfoModel>(
      endpoint: ApiEndpoint.serviceInfo,
    );
  }
}
