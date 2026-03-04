import 'package:app/helpers/dto/base_request.dto.dart';

class AutoLoginDto implements BaseRequestDto {
  final String userId;
  final String refreshToken;
  final String? deviceToken;
  final String deviceType;
  final String deviceName;
  final String deviceModel;

  AutoLoginDto({
    required this.userId,
    required this.refreshToken,
    this.deviceToken,
    required this.deviceType,
    required this.deviceName,
    required this.deviceModel,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "refreshToken": refreshToken,
      "deviceToken": deviceToken,
      "deviceType": deviceType,
      "deviceName": deviceName,
      "deviceModel": deviceModel,
    };
  }
}
