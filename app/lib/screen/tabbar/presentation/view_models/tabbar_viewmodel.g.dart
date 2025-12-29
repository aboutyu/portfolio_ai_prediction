// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabbar_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TabbarViewmodel)
const tabbarViewmodelProvider = TabbarViewmodelProvider._();

final class TabbarViewmodelProvider
    extends $AsyncNotifierProvider<TabbarViewmodel, void> {
  const TabbarViewmodelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tabbarViewmodelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tabbarViewmodelHash();

  @$internal
  @override
  TabbarViewmodel create() => TabbarViewmodel();
}

String _$tabbarViewmodelHash() => r'269b8bfa19da66a9a2f000a9b6aed773e208c9da';

abstract class _$TabbarViewmodel extends $AsyncNotifier<void> {
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
