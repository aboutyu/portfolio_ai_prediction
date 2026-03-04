// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dailyRepository)
const dailyRepositoryProvider = DailyRepositoryProvider._();

final class DailyRepositoryProvider
    extends
        $FunctionalProvider<DailyRepository, DailyRepository, DailyRepository>
    with $Provider<DailyRepository> {
  const DailyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyRepositoryHash();

  @$internal
  @override
  $ProviderElement<DailyRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DailyRepository create(Ref ref) {
    return dailyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DailyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DailyRepository>(value),
    );
  }
}

String _$dailyRepositoryHash() => r'cc821f964b347b7f89c83f2e79e9280f9ef70c60';
