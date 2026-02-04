import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/screen/chat/data/models/chat_message_model.dart';
import 'package:app/screen/chat/presentation/view_models/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessageInputWidget extends ConsumerStatefulWidget {
  const ChatMessageInputWidget({super.key, required this.role});

  final ChatMessageRole role;

  @override
  ConsumerState<ChatMessageInputWidget> createState() =>
      _ChatMessageInputWidgetState();
}

class _ChatMessageInputWidgetState
    extends ConsumerState<ChatMessageInputWidget> {
  final TextEditingController _textController = TextEditingController();
  ChatMessageRole get _role => widget.role;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final chatState = ref.watch(chatViewModelProvider);

    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: context.tr.chatInputHintText,
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
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
    ref.read(chatViewModelProvider.notifier).sendMessage(text, _role);

    // 입력창 비우기
    _textController.clear();
  }
}
