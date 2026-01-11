// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_food_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(recordFoodRepository)
const recordFoodRepositoryProvider = RecordFoodRepositoryProvider._();

final class RecordFoodRepositoryProvider
    extends
        $FunctionalProvider<
          RecordFoodRepository,
          RecordFoodRepository,
          RecordFoodRepository
        >
    with $Provider<RecordFoodRepository> {
  const RecordFoodRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordFoodRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordFoodRepositoryHash();

  @$internal
  @override
  $ProviderElement<RecordFoodRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RecordFoodRepository create(Ref ref) {
    return recordFoodRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecordFoodRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecordFoodRepository>(value),
    );
  }
}

String _$recordFoodRepositoryHash() =>
    r'9d20f18309ad70751111b134357ad1f7fc28e463';
