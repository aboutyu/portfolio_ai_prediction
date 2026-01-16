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

  int _currentPage = 0;
  bool _hasNextPage = true;
  bool _isFetching = false;

  @override
  Future<List<ChatMessageModel>> build() async {
    userId = int.parse(
      await _storage.read(key: AuthStorageKey.sequence.string) ?? '0',
    );
    _currentPage = 0;
    _hasNextPage = true;
    _isFetching = false;

    _initSocket();
    ref.onDispose(() {
      debugMessage('Socket Disconnected');
      _socket.disconnect(); // 연결 끊기
      _socket.dispose(); // 소켓 객체 메모리 해제
    });
    return await _loadHistory(page: _currentPage);
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
      debugMessage('📩 New message received: $data');
      final newMessage = ChatMessageModel.fromJson(data);
      // 새 메시지를 맨 앞에 추가합니다.
      state = AsyncValue.data([
        newMessage, // 새 메시지 (Index 0 -> 화면 맨 아래)
        ...state.value ?? [],
      ]);
    });
  }

  Future<List<ChatMessageModel>> _loadHistory({required int page}) async {
    try {
      final repository = ref.read(chatMessageHistoryRepositoryProvider);
      final response = await repository.fetchChatHistory(
        page: page,
        pageNum: defaultPageNum,
      );

      final newMessages = response.data ?? [];
      final totalServerCount = response.pageInfo?.totalCount ?? 0;

      // 현재까지 확보한 메시지 개수 계산
      // 1페이지면 지금 가져온게 전부, 2페이지 이상이면 기존 개수 + 새로 가져온 개수
      final currentListLength = (page == 0 ? 0 : (state.value?.length ?? 0));
      final totalLoadedCount = currentListLength + newMessages.length;

      // 현재 로드된 개수가 서버의 전체 개수보다 크거나 같으면 더 이상 페이지 없음
      if (totalLoadedCount >= totalServerCount) {
        _hasNextPage = false;
      } else {
        _hasNextPage = true;
      }

      return newMessages;
    } catch (e) {
      // 에러 발생 시 일단 더 로딩하지 않도록 막거나, 에러 처리를 함
      _hasNextPage = false;
      return [];
    }
  }

  // [핵심] 과거 데이터 더 불러오기 (스크롤 올렸을 때 호출)
  Future<void> loadMoreHistory() async {
    // 이미 로딩 중이거나, 더 이상 데이터가 없으면 리턴
    if (_isFetching || !_hasNextPage) return;

    _isFetching = true; // 로딩 시작

    try {
      final nextPage = _currentPage + 1;
      final oldMessages = await _loadHistory(page: nextPage);

      if (oldMessages.isNotEmpty) {
        _currentPage = nextPage;

        // [중요] 기존 state(최신 데이터들) 뒤에 과거 데이터를 붙임
        // reverse: true 리스트에서는 리스트 뒤쪽이 '화면 상단(과거)'이 됨
        final currentList = state.value ?? [];
        state = AsyncValue.data([...currentList, ...oldMessages]);
      }
    } catch (e) {
      // 에러 처리
    } finally {
      _isFetching = false; // 로딩 끝
    }
  }

  void sendMessage(String text, ChatMessageRole role) {
    debugMessage('Sending message: $text');
    try {
      // 1. 소켓으로 전송
      _socket.emit('connect_chat_messages', {
        'userId': userId,
        'message': text,
        'messageRole': role.name,
        'language': localeLanguage,
      });
      // 2. 내 화면에 즉시 표시
      state = AsyncValue.data([
        ChatMessageModel(
          messageRole: ChatMessageRole.user,
          message: text,
          sequence: 0, // 임시 ID
          createTime: DateTime.now(),
          // userSequence 등 필요한 필드 추가
        ),
        ...state.value ?? [], // 기존 메시지들은 뒤로 밀어냄
      ]);
    } catch (e) {
      debugMessage('Error sending message: $e');
    }
  }
}
