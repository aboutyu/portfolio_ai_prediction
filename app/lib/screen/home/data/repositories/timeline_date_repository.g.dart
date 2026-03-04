// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_date_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(timelineDateRepository)
const timelineDateRepositoryProvider = TimelineDateRepositoryProvider._();

final class TimelineDateRepositoryProvider
    extends
        $FunctionalProvider<
          TimelineDateRepository,
          TimelineDateRepository,
          TimelineDateRepository
        >
    with $Provider<TimelineDateRepository> {
  const TimelineDateRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timelineDateRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timelineDateRepositoryHash();

  @$internal
  @override
  $ProviderElement<TimelineDateRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TimelineDateRepository create(Ref ref) {
    return timelineDateRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimelineDateRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimelineDateRepository>(value),
    );
  }
}

String _$timelineDateRepositoryHash() =>
    r'3095f897d22543c70487484acfab3e9f7a9049ef';
