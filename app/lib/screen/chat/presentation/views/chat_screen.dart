import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/chat/data/models/chat_message_model.dart';
import 'package:app/screen/chat/presentation/view_models/chat_view_model.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // 메시지 전송 후 스크롤을 맨 아래로 내리는 함수
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      // 약간의 지연을 주어 UI가 렌더링 된 후 스크롤되도록 함
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatViewModelProvider);

    // 메시지 개수가 늘어나면(새 메시지 도착 시) 스크롤 내리기
    ref.listen(chatViewModelProvider, (previous, next) {
      if (next.hasValue &&
          (previous?.value?.length ?? 0) < next.value!.length) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      appBar: appBarWidget(context.tr.chatAppbarText),
      body: Column(
        children: [
          // 1. 채팅 리스트 영역
          Expanded(
            child: chatState.when(
              // 데이터 로딩 중
              loading: () => const Center(child: CircularProgressIndicator()),
              // 에러 발생
              error: (err, stack) => Center(child: Text('에러 발생: $err')),
              // 데이터 성공 로드
              data: (messages) {
                if (messages.isEmpty) {
                  return const Center(child: Text('대화를 시작해보세요!'));
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return _buildMessageBubble(msg);
                  },
                );
              },
            ),
          ),

          // 2. 입력창 영역
          _buildInputArea(),
        ],
      ),
    );
  }

  // 메시지 말풍선 위젯
  Widget _buildMessageBubble(ChatMessageModel msg) {
    // role이나 sender를 확인하여 나(User)인지 AI(Bot)인지 구분
    // 모델의 구조에 따라 msg.sender == ChatMessageRole.user 등으로 수정하세요.
    final isMe = msg.sender == ChatMessageRole.user;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7, // 화면의 70%까지만 차지
        ),
        decoration: BoxDecoration(
          color: isMe ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isMe ? const Radius.circular(12) : Radius.circular(0),
            bottomRight: isMe ? Radius.circular(0) : const Radius.circular(12),
          ),
        ),
        child: Text(
          msg.message,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  // 하단 입력창 위젯
  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: SafeArea(
        // 아이폰 하단 홈 바 영역 침범 방지
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: '메시지를 입력하세요...',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                // 엔터 키 누르면 전송
                onSubmitted: (_) => _handleSend(),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.send, color: Colors.blue),
              onPressed: _handleSend,
            ),
          ],
        ),
      ),
    );
  }

  // 전송 버튼 동작
  void _handleSend() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;

    // ViewModel의 sendMessage 호출
    ref.read(chatViewModelProvider.notifier).sendMessage(text);

    // 입력창 비우기
    _textController.clear();
  }
}
