// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FaqViewModel)
const faqViewModelProvider = FaqViewModelProvider._();

final class FaqViewModelProvider
    extends $AsyncNotifierProvider<FaqViewModel, List<NoticeModel>> {
  const FaqViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faqViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faqViewModelHash();

  @$internal
  @override
  FaqViewModel create() => FaqViewModel();
}

String _$faqViewModelHash() => r'0ed56e6dd12f14b8c3654563163f3d3f339c6a39';

abstract class _$FaqViewModel extends $AsyncNotifier<List<NoticeModel>> {
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
