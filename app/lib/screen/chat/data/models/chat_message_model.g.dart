// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    _ChatMessageModel(
      sender: $enumDecode(_$ChatMessageRoleEnumMap, json['sender']),
      message: json['message'] as String,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$ChatMessageModelToJson(_ChatMessageModel instance) =>
    <String, dynamic>{
      'sender': _$ChatMessageRoleEnumMap[instance.sender]!,
      'message': instance.message,
      'timestamp': instance.timestamp?.toIso8601String(),
    };

const _$ChatMessageRoleEnumMap = {
  ChatMessageRole.user: 'user',
  ChatMessageRole.llama: 'llama',
  ChatMessageRole.gemini: 'gemini',
};
