// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_health_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recordHealthRepository)
const recordHealthRepositoryProvider = RecordHealthRepositoryProvider._();

final class RecordHealthRepositoryProvider
    extends
        $FunctionalProvider<
          RecordHealthRepository,
          RecordHealthRepository,
          RecordHealthRepository
        >
    with $Provider<RecordHealthRepository> {
  const RecordHealthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordHealthRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordHealthRepositoryHash();

  @$internal
  @override
  $ProviderElement<RecordHealthRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecordHealthRepository create(Ref ref) {
    return recordHealthRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecordHealthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecordHealthRepository>(value),
    );
  }
}

String _$recordHealthRepositoryHash() =>
    r'a32cee0c7adaaaab2bbd6718fefc32c7dcc0e82a';
