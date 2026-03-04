// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DailyViewModel)
const dailyViewModelProvider = DailyViewModelProvider._();

final class DailyViewModelProvider
    extends $AsyncNotifierProvider<DailyViewModel, List<Log>> {
  const DailyViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyViewModelHash();

  @$internal
  @override
  DailyViewModel create() => DailyViewModel();
}

String _$dailyViewModelHash() => r'e75f4ece363446366c7d976ed97d18f71651bfbb';

abstract class _$DailyViewModel extends $AsyncNotifier<List<Log>> {
  FutureOr<List<Log>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Log>>, List<Log>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Log>>, List<Log>>,
              AsyncValue<List<Log>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(DailyDate)
const dailyDateProvider = DailyDateProvider._();

final class DailyDateProvider extends $NotifierProvider<DailyDate, DateTime> {
  const DailyDateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dailyDateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dailyDateHash();

  @$internal
  @override
  DailyDate create() => DailyDate();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$dailyDateHash() => r'9fab6077c79f476ccc2ef021e6fb231b6e239b46';

abstract class _$DailyDate extends $Notifier<DateTime> {
  DateTime build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<DateTime, DateTime>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime, DateTime>,
              DateTime,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
