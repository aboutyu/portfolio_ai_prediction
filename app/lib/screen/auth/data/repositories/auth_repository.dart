import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/enums/api_endpoint.dart';
import 'package:app/helpers/enums/platform.enum.dart';
import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/auth/data/dto/autoLogin.dto.dart';
import 'package:app/screen/auth/data/dto/login.dto.dart';
import 'package:app/screen/auth/data/dto/signup.dto.dart';
import 'package:app/screen/auth/data/models/login_response.model.dart';
import 'package:app/screen/auth/data/models/signup_response.model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return AuthRepository(client);
}

class AuthRepository {
  final CoreApiProvider _client;
  final _storage = const FlutterSecureStorage();

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

  Future<CoreResponse<LoginResponse>> autoLogin() async {
    final fcmToken = await AppConfig.platform.fcmToken;
    final osVersion = await AppConfig.platform.osVersion;
    final model = await AppConfig.platform.deviceModel;

    final userid = await _storage.read(key: 'userId') ?? '';
    final refreshToken = await _storage.read(key: 'refreshToken') ?? '';

    final dto = AutoLoginDto(
      userId: userid,
      refreshToken: refreshToken,
      deviceToken: fcmToken,
      deviceType: AppConfig.platform.name,
      deviceName: osVersion,
      deviceModel: model,
    );

    return await _client.request<LoginResponse>(
      endpoint: ApiEndpoint.requestToken,
      dto: dto,
    );
  }

  Future<CoreResponse<SignupResponse>> signup(
    String userId,
    String password,
    String username,
  ) async {
    final dto = SignupDto(
      userId: userId,
      password: password,
      username: username,
    );

    return await _client.request<SignupResponse>(
      endpoint: ApiEndpoint.signup,
      dto: dto,
    );
  }
}
