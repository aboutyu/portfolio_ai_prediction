// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      sequence: (json['sequence'] as num).toInt(),
      userId: json['userId'] as String,
      username: json['username'] as String,
      lastLogin: DateTime.parse(json['lastLogin'] as String),
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'userId': instance.userId,
      'username': instance.username,
      'lastLogin': instance.lastLogin.toIso8601String(),
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
