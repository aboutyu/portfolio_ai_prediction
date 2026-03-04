import 'package:app/screen/chat/data/models/chat_message_model.dart';
import 'package:app/widgets/appbar_widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class AppbarChatWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppbarChatWidget({
    super.key,
    required this.title,
    required this.initRole,
    required this.onModelSelected,
  });

  final String title;
  final ChatMessageRole initRole;
  final void Function(ChatMessageRole) onModelSelected;

  @override
  State<AppbarChatWidget> createState() => _AppbarChatWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarChatWidgetState extends State<AppbarChatWidget> {
  late ChatMessageRole _role;

  @override
  void initState() {
    _role = widget.initRole;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppbarWidget(
      title: widget.title,
      actions: [
        IconButton(
          icon: _role.iconAsset,
          color: Colors.grey,
          onPressed: () async => _showModelSelectionDialog(),
        ),
      ],
    );
  }

  Future<void> _showModelSelectionDialog() async {
    // showDialog는 Future를 반환하므로 await로 선택값을 기다립니다.
    final ChatMessageRole? selectedRole = await showDialog<ChatMessageRole>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('AI 모델 선택'),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          children: [
            // 2. 옵션 1: Gemini
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ChatMessageRole.gemini);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    ChatMessageRole.gemini.iconAsset,
                    const SizedBox(width: 12),
                    const Text('Google Gemini', style: TextStyle(fontSize: 16)),
                    if (_role == ChatMessageRole.gemini) ...[
                      const Spacer(),
                      const Icon(Icons.check, color: Colors.blue),
                    ],
                  ],
                ),
              ),
            ),
            const Divider(), // 구분선
            // 3. 옵션 2: Llama
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, ChatMessageRole.llama);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    ChatMessageRole.llama.iconAsset,
                    const SizedBox(width: 12),
                    const Text(
                      'Ollama(llama3.2:1b)',
                      style: TextStyle(fontSize: 16),
                    ),
                    if (_role == ChatMessageRole.llama) ...[
                      const Spacer(),
                      const Icon(Icons.check, color: Colors.blue),
                    ],
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );

    // 4. 선택된 값이 있고, 기존과 다르다면 상태 업데이트
    if (selectedRole != null && selectedRole != _role) {
      setState(() {
        _role = selectedRole;
      });
      // 부모 위젯(ChatScreen 등)에 변경 알림
      widget.onModelSelected(_role);
    }
  }
}
