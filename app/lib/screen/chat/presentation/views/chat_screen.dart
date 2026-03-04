import 'package:app/helpers/extensions/async_value_extension.dart';
import 'package:app/helpers/extensions/l10n_extension.dart';
import 'package:app/helpers/storages/user_info.dart';
import 'package:app/screen/chat/data/models/chat_message_model.dart';
import 'package:app/screen/chat/presentation/view_models/chat_view_model.dart';
import 'package:app/screen/chat/presentation/widgets/chat_message_bubble_widget.dart';
import 'package:app/screen/chat/presentation/widgets/chat_message_input_widget.dart';
import 'package:app/screen/chat/presentation/widgets/chat_notice_widget.dart';
import 'package:app/widgets/appbar_widgets/appbar_chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  ChatMessageRole _role = ChatMessageRole.llama;
  bool _isNoticeVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  // 메시지 전송/수신 시 화면 맨 아래(최신)로 이동
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  // 스크롤 리스너 (공지 숨김/표시 + 무한 스크롤 통합)
  void _scrollListener() {
    // 1. 공지사항 표시 로직 (reverse: true 이므로 방향 반대 주의)
    // forward: 리스트 끝(과거)으로 이동 (화면 위로)
    // reverse: 리스트 처음(최신)으로 이동 (화면 아래로)
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      // 위로 스크롤 중 -> 공지 보이기 (원하는 UX에 맞춰 조정)
      if (!_isNoticeVisible) setState(() => _isNoticeVisible = true);
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      // 아래로 스크롤 중 -> 공지 숨기기
      if (_isNoticeVisible) setState(() => _isNoticeVisible = false);
    }

    // 2. [핵심] 무한 스크롤 (Paging) 로직
    // 현재 스크롤 위치가 최대 범위(리스트의 맨 위 = 과거 데이터 끝)에 거의 도달했는지 확인
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // 뷰모델에 "더 가져와!" 요청
      ref.read(chatViewModelProvider.notifier).loadMoreHistory();
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatViewModelProvider);
    final userInfo = ref.read(userInfoProvider);

    ref.listen(chatViewModelProvider, (previous, next) {
      // 1. 데이터가 로드되지 않았거나 비어있으면 무시
      if (!next.hasValue || next.value!.isEmpty) return;

      // 2. 이전 데이터가 없으면(최초 로딩 시) -> 맨 아래로 스크롤
      if (previous?.value == null || previous!.value!.isEmpty) {
        // 최초 로딩시에는 약간의 딜레이 후 이동
        _scrollToBottom();
        return;
      }

      // 3. "새 메시지"가 왔는지 판단
      // 리스트 길이는 늘어났더라도, 가장 최신 메시지(0번)의 ID(sequence)가 같다면
      // 그건 "과거 데이터"를 불러온 것이므로 스크롤을 내리면 안 됨.
      final prevLatestMsg = previous.value!.first;
      final nextLatestMsg = next.value!.first;

      // 최신 메시지가 달라졌을 때만 스크롤을 내림 (새 메시지 수신/전송 시)
      if (prevLatestMsg.sequence != nextLatestMsg.sequence) {
        _scrollToBottom();
      }
    });

    return Scaffold(
      appBar: AppbarChatWidget(
        title: context.tr.chatAppbarText,
        initRole: _role,
        onModelSelected: (role) {
          setState(() {
            _role = role;
          });
        },
      ),
      body: Column(
        children: [
          ChatNoticeWidget(isNoticeVisible: _isNoticeVisible),

          // 1. 채팅 리스트 영역
          Expanded(
            child: chatState.draws(
              data: (messages) {
                if (messages.isEmpty) {
                  return Center(child: Text(context.tr.chatNoMessages));
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return ChatMessageBubbleWidget(
                      msg: msg,
                      thumbnailUrl: userInfo.value?.thumbnail,
                    );
                  },
                );
              },
            ),
          ),

          ChatMessageInputWidget(role: _role),
        ],
      ),
    );
  }
}
