// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_initializer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppInitialization)
const appInitializationProvider = AppInitializationProvider._();

final class AppInitializationProvider
    extends $AsyncNotifierProvider<AppInitialization, void> {
  const AppInitializationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInitializationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInitializationHash();

  @$internal
  @override
  AppInitialization create() => AppInitialization();
}

String _$appInitializationHash() => r'ff71c0397ea9a6498c634c0f32f780c5a7fb26b7';

abstract class _$AppInitialization extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
