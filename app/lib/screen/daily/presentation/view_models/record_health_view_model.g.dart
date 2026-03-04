// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_health_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecordHealthViewModel)
const recordHealthViewModelProvider = RecordHealthViewModelProvider._();

final class RecordHealthViewModelProvider
    extends $NotifierProvider<RecordHealthViewModel, void> {
  const RecordHealthViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordHealthViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordHealthViewModelHash();

  @$internal
  @override
  RecordHealthViewModel create() => RecordHealthViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$recordHealthViewModelHash() =>
    r'86834308c65193b8f1cd2eed3f40d60004a56de8';

abstract class _$RecordHealthViewModel extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
