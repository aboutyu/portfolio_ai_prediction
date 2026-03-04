// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    _SignupResponse(
      sequence: (json['sequence'] as num).toInt(),
      userId: json['userId'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$SignupResponseToJson(_SignupResponse instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'userId': instance.userId,
      'username': instance.username,
    };
