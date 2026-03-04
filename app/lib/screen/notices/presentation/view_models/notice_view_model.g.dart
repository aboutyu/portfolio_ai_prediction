// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NoticeViewModel)
const noticeViewModelProvider = NoticeViewModelProvider._();

final class NoticeViewModelProvider
    extends $AsyncNotifierProvider<NoticeViewModel, List<NoticeModel>> {
  const NoticeViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noticeViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noticeViewModelHash();

  @$internal
  @override
  NoticeViewModel create() => NoticeViewModel();
}

String _$noticeViewModelHash() => r'f4eacb6932a737a45a0b39e3637eb01ed99bd4ce';

abstract class _$NoticeViewModel extends $AsyncNotifier<List<NoticeModel>> {
  FutureOr<List<NoticeModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<NoticeModel>>, List<NoticeModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<NoticeModel>>, List<NoticeModel>>,
              AsyncValue<List<NoticeModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
