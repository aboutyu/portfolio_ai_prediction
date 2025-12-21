import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/enums/api_endpoint.dart';
import 'package:app/helpers/enums/platform.enum.dart';
import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/auth/data/dto/login.dto.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return AuthRepository(client);
}

class AuthRepository {
  final CoreApiProvider _client;

  AuthRepository(this._client);

  Future<CoreResponse<LoginResponse>> login(
    String userid,
    String password,
  ) async {
    final fcmToken = await AppConfig.platform.fcmToken;
    final osVersion = await AppConfig.platform.osVersion;
    final model = await AppConfig.platform.deviceModel;

    final dto = LoginDto(
      userId: userid,
      password: password,
      deviceToken: fcmToken,
      deviceType: AppConfig.platform.name,
      deviceName: osVersion,
      deviceModel: model,
    );

    return await _client.request<LoginResponse>(
      endpoint: ApiEndpoint.login,
      dto: dto,
    );
  }
}
