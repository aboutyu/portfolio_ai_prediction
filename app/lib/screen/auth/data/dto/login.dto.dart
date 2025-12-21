import 'package:app/helpers/dto/base_request.dto.dart';

class LoginDto implements BaseRequestDto {
  final String userId;
  final String password;
  final String? deviceToken;
  final String deviceType;
  final String deviceName;
  final String deviceModel;

  LoginDto({
    required this.userId,
    required this.password,
    this.deviceToken,
    required this.deviceType,
    required this.deviceName,
    required this.deviceModel,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "password": password,
      "deviceToken": deviceToken,
      "deviceType": deviceType,
      "deviceName": deviceName,
      "deviceModel": deviceModel,
    };
  }
}
