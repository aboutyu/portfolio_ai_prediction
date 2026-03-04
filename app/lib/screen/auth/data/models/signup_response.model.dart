import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_response.model.freezed.dart';
part 'signup_response.model.g.dart';

@freezed
abstract class SignupResponse with _$SignupResponse {
  const factory SignupResponse({
    required int sequence,
    required String userId,
    required String username,
  }) = _SignupResponse;

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}
