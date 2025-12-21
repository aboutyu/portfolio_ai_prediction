// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loading_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoadingProvider)
const loadingProviderProvider = LoadingProviderProvider._();

final class LoadingProviderProvider
    extends $NotifierProvider<LoadingProvider, bool> {
  const LoadingProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadingProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadingProviderHash();

  @$internal
  @override
  LoadingProvider create() => LoadingProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$loadingProviderHash() => r'936bb31bfd1e20e522c2d4fdf975367a1e737ad5';

abstract class _$LoadingProvider extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
