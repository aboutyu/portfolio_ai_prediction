// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    _ChatMessageModel(
      sequence: (json['sequence'] as num).toInt(),
      messageRole: $enumDecode(_$ChatMessageRoleEnumMap, json['messageRole']),
      message: json['message'] as String,
      createTime: DateTime.parse(json['createTime'] as String),
    );

Map<String, dynamic> _$ChatMessageModelToJson(_ChatMessageModel instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'messageRole': _$ChatMessageRoleEnumMap[instance.messageRole]!,
      'message': instance.message,
      'createTime': instance.createTime.toIso8601String(),
    };

const _$ChatMessageRoleEnumMap = {
  ChatMessageRole.user: 'user',
  ChatMessageRole.llama: 'llama',
  ChatMessageRole.gemini: 'gemini',
};
