import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.freezed.dart';
part 'chat_message_model.g.dart';

@JsonEnum()
enum ChatMessageRole {
  @JsonValue('user')
  user,
  @JsonValue('llama')
  llama,
  @JsonValue('gemini')
  gemini,
}

extension ChatMessageRoleExtension on ChatMessageRole {
  Widget get iconAsset {
    switch (this) {
      case ChatMessageRole.user:
        return Image.asset('assets/icons/user_icon.png', width: 24, height: 24);
      case ChatMessageRole.llama:
        return SvgPicture.asset(
          'assets/icons/ollama_icon.svg',
          width: 24,
          height: 24,
        );
      case ChatMessageRole.gemini:
        return SvgPicture.asset(
          'assets/icons/gemini_icon.svg',
          width: 24,
          height: 24,
        );
    }
  }
}

@freezed
abstract class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    /// 메시지 시퀀스
    required int sequence,
    required ChatMessageRole messageRole,

    /// 메시지 내용
    required String message,

    /// 생성 시간 (JSON의 ISO 8601 문자열이 DateTime으로 변환)
    required DateTime createTime,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}
