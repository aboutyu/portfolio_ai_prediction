import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.model.freezed.dart';
part 'login_response.model.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required int sequence,
    required String userId,
    required String username,
    required DateTime lastLogin,
    required String accessToken,
    required String refreshToken,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
