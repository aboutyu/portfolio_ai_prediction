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

@freezed
abstract class ChatMessageModel with _$ChatMessageModel {
  const factory ChatMessageModel({
    /// 메시지 고유 번호 (PK)
    required int sequence,
    required ChatMessageRole messageRole,

    /// 메시지 내용
    required String message,

    /// 생성 시간 (JSON의 ISO 8601 문자열이 DateTime으로 자동 변환됨)
    required DateTime createTime,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}
