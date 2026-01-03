import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/screen/auth/data/models/terms_model.dart';
import 'package:app/screen/auth/data/repositories/terms_respository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'terms_view_model.g.dart';

@riverpod
class TermsViewModel extends _$TermsViewModel {
  @override
  Future<List<TermsModel>> build() async {
    final repository = ref.read(termsRepositoryProvider);
    final response = await repository.fetchTermsList();
    debugMessage('[TermsViewModel] fetchTermsList Response: $response');
    return response.data ?? [];
  }
}
