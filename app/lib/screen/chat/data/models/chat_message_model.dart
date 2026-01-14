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
    required ChatMessageRole sender, // 'user' or 'llama' or 'gemini'
    required String message,
    DateTime? timestamp,
  }) = _ChatMessageModel;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);
}
