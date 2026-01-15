import 'package:app/helpers/commons/common_funcs.dart';
import 'package:app/helpers/cores/app_config.dart';
import 'package:app/helpers/storages/auth_storage.dart';
import 'package:app/screen/chat/data/repositories/chat_message_history_repository.dart';
import 'package:app/screen/chat/data/models/chat_message_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final chatViewModelProvider =
    AsyncNotifierProvider<ChatViewModel, List<ChatMessageModel>>(
      () => ChatViewModel(),
    );

class ChatViewModel extends AsyncNotifier<List<ChatMessageModel>> {
  late IO.Socket _socket;
  late int userId;
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<List<ChatMessageModel>> build() async {
    userId = int.parse(
      await _storage.read(key: AuthStorageKey.sequence.string) ?? '0',
    );

    _initSocket();
    ref.onDispose(() {
      debugMessage('Socket Disconnected');
      _socket.disconnect(); // 연결 끊기
      _socket.dispose(); // 소켓 객체 메모리 해제
    });
    return await _loadHistory();
  }

  void _initSocket() {
    _socket = IO.io(
      AppConfig.webSocketUrl,
      IO.OptionBuilder()
          .setTransports(['websocket', 'polling'])
          .setPath(AppConfig.webSocketPath)
          .disableAutoConnect()
          .build(),
    );

    // 연결 및 성공/실패 로그
    _socket.connect();
    _socket.onConnect((_) => debugMessage('✅ Socket Connected to Server!'));
    _socket.onConnectError((e) => debugMessage('❌ Connect Error: $e'));
    _socket.onError((e) => debugMessage('❌ Error: $e'));

    _socket.on('receive_message', (data) {
      // 실시간으로 답변이 오면 리스트에 추가
      final newMessage = ChatMessageModel.fromJson(data);
      state = AsyncValue.data([...state.value ?? [], newMessage]);
    });
  }

  Future<List<ChatMessageModel>> _loadHistory() async {
    final repository = ref.read(chatMessageHistoryRepositoryProvider);
    final response = await repository.fetchChatHistory(page: 0, pageNum: 20);
    state = AsyncValue.data(response.data ?? []);
    return response.data ?? [];
  }

  void sendMessage(String text, ChatMessageRole role) {
    debugMessage('Sending message: $text');
    try {
      // 1. 소켓으로 전송
      _socket.emit('connect_chat_messages', {
        'userId': userId,
        'message': text,
        'messageRole': role.name,
      });
      // 2. 내 화면에 즉시 표시
      state = AsyncValue.data([
        ...state.value ?? [],
        ChatMessageModel(
          messageRole: role,
          message: text,
          sequence: 0,
          createTime: DateTime.now(),
        ),
      ]);
    } catch (e) {
      debugMessage('Error sending message: $e');
    }
  }
}
