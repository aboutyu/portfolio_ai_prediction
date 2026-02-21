// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_initializer_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appInitializerRepository)
const appInitializerRepositoryProvider = AppInitializerRepositoryProvider._();

final class AppInitializerRepositoryProvider
    extends
        $FunctionalProvider<
          AppInitializerRepository,
          AppInitializerRepository,
          AppInitializerRepository
        >
    with $Provider<AppInitializerRepository> {
  const AppInitializerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitializerRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitializerRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppInitializerRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppInitializerRepository create(Ref ref) {
    return appInitializerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppInitializerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppInitializerRepository>(value),
    );
  }
}

String _$appInitializerRepositoryHash() =>
    r'893c47f599165327733bf9a4da0a2b585db05148';
