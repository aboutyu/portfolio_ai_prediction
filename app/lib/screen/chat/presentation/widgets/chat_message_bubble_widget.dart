import 'package:app/screen/chat/data/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';

class ChatMessageBubbleWidget extends StatelessWidget {
  const ChatMessageBubbleWidget({
    super.key,
    required this.msg,
    this.thumbnailUrl,
  });

  final ChatMessageModel msg;
  final String? thumbnailUrl;
  bool get _isMe => msg.messageRole == ChatMessageRole.user;

  @override
  Widget build(BuildContext context) {
    final textColor = _isMe ? Colors.white : Colors.black87;
    final iconImage = !_isMe
        ? msg.messageRole.iconAsset
        : thumbnailUrl == null
        ? msg.messageRole.iconAsset
        : ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              thumbnailUrl!,
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          );

    return Column(
      crossAxisAlignment: _isMe
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        // 1. 아이콘 (말풍선 위에 위치)
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[200],
            child: iconImage,
          ),
        ),

        // 2. 말풍선
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
            color: _isMe ? Colors.blue[300] : Colors.grey[200],
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(16),
              topRight: const Radius.circular(16),
              // 말풍선 꼬리 방향 처리
              bottomLeft: _isMe
                  ? const Radius.circular(16)
                  : const Radius.circular(2), // 상대방: 왼쪽 아래 뾰족
              bottomRight: _isMe
                  ? const Radius.circular(2) // 나: 오른쪽 아래 뾰족
                  : const Radius.circular(16),
            ),
          ),
          child: MarkdownBody(
            data: msg.message,
            selectable: true, // 텍스트 복사 가능하게 설정
            styleSheet: MarkdownStyleSheet(
              p: TextStyle(color: textColor, fontSize: 16, height: 1.5),
              strong: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              listBullet: TextStyle(color: textColor, fontSize: 16),
              code: TextStyle(
                color: textColor,
                backgroundColor: _isMe ? Colors.yellow[200] : Colors.grey[200],
                fontSize: 14,
              ),
            ),
          ),
        ),

        // 3. 시간 (말풍선 아래에 위치)
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            _formatTime(msg.createTime),
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ),
      ],
    );
  }

  String _formatTime(DateTime time) {
    // intl 패키지 사용 시 (없으면 직접 문자열 조합)
    return DateFormat('a h:mm', 'ko_KR').format(time);
  }
}
