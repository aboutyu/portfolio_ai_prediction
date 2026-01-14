// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_history_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatMessageHistoryRepository)
const chatMessageHistoryRepositoryProvider =
    ChatMessageHistoryRepositoryProvider._();

final class ChatMessageHistoryRepositoryProvider
    extends
        $FunctionalProvider<
          ChatMessageHistoryRepository,
          ChatMessageHistoryRepository,
          ChatMessageHistoryRepository
        >
    with $Provider<ChatMessageHistoryRepository> {
  const ChatMessageHistoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatMessageHistoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatMessageHistoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChatMessageHistoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatMessageHistoryRepository create(Ref ref) {
    return chatMessageHistoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatMessageHistoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatMessageHistoryRepository>(value),
    );
  }
}

String _$chatMessageHistoryRepositoryHash() =>
    r'de71320f08861a6c68bfe82a0693f07cbc6d0977';
