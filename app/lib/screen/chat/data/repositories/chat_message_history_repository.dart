import 'package:app/helpers/networks/core_api_provider.dart';
import 'package:app/helpers/networks/enums/api_endpoint.dart';
import 'package:app/helpers/networks/model/core_response.model.dart';
import 'package:app/screen/chat/data/dto/chat_message_history_dto.dart';
import 'package:app/screen/chat/data/models/chat_message_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_message_history_repository.g.dart';

@riverpod
ChatMessageHistoryRepository chatMessageHistoryRepository(Ref ref) {
  final client = ref.watch(coreApiProviderProvider);
  return ChatMessageHistoryRepository(client);
}

class ChatMessageHistoryRepository {
  final CoreApiProvider _client;

  ChatMessageHistoryRepository(this._client);

  Future<CoreResponse<List<ChatMessageModel>>> fetchChatHistory({
    required int page,
    required int pageNum,
    String? keyword,
  }) async {
    final dto = ChatMessageHistoryDto(
      page: page,
      pageNum: pageNum,
      keyword: keyword,
    );

    return await _client.request<List<ChatMessageModel>>(
      endpoint: ApiEndpoint.chatMessageHistory,
      dto: dto,
    );
  }
}
