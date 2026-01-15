import 'package:app/screen/chat/data/models/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';

class ChatMessageBubbleWidget extends StatelessWidget {
  const ChatMessageBubbleWidget({super.key, required this.msg});

  final ChatMessageModel msg;
  bool get _isMe => msg.messageRole == ChatMessageRole.user;

  @override
  Widget build(BuildContext context) {
    final textColor = _isMe ? Colors.white : Colors.black87;

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
            backgroundColor: const Color.fromARGB(255, 237, 242, 229),
            child: msg.messageRole.iconAsset,
          ),
        ),

        // 2. 말풍선
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
            color: _isMe ? Colors.blueAccent : Colors.grey[300],
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
              // 일반 텍스트 스타일
              p: TextStyle(
                color: textColor,
                fontSize: 16,
                height: 1.5, // 줄간격 살짝 넉넉하게
              ),
              // **굵게** 스타일
              strong: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              // * 목록 스타일
              listBullet: TextStyle(color: textColor, fontSize: 16),
              // 코드 블럭 스타일 (옵션)
              code: TextStyle(
                color: _isMe ? Colors.white : Colors.black,
                backgroundColor: _isMe ? Colors.blue[700] : Colors.grey[400],
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
