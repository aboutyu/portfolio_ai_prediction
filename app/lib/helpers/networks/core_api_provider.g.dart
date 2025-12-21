// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_api_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coreApiProvider)
const coreApiProviderProvider = CoreApiProviderProvider._();

final class CoreApiProviderProvider
    extends
        $FunctionalProvider<CoreApiProvider, CoreApiProvider, CoreApiProvider>
    with $Provider<CoreApiProvider> {
  const CoreApiProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coreApiProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coreApiProviderHash();

  @$internal
  @override
  $ProviderElement<CoreApiProvider> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoreApiProvider create(Ref ref) {
    return coreApiProvider(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoreApiProvider value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoreApiProvider>(value),
    );
  }
}

String _$coreApiProviderHash() => r'252bc38c312952f363cff0d589bfeb962706112c';
