import 'package:app/helpers/dto/base_request.dto.dart';

class SignupDto implements BaseRequestDto {
  final String userId;
  final String password;
  final String username;

  SignupDto({
    required this.userId,
    required this.password,
    required this.username,
  });

  @override
  Map<String, dynamic> toJson() {
    return {"userId": userId, "password": password, "username": username};
  }
}
