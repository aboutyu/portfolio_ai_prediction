import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/auth/data/models/terms_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'terms_respository.g.dart';

@riverpod
TermsRepository termsRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return TermsRepository(client);
}

class TermsRepository {
  final CoreApiProvider _client;

  TermsRepository(this._client);

  Future<CoreResponse<List<TermsModel>>> fetchTermsList() async {
    return await _client.request<List<TermsModel>>(
      endpoint: ApiEndpoint.termsList,
    );
  }
}
