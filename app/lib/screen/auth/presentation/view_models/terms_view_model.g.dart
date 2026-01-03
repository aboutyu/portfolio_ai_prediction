// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TermsViewModel)
const termsViewModelProvider = TermsViewModelProvider._();

final class TermsViewModelProvider
    extends $AsyncNotifierProvider<TermsViewModel, List<TermsModel>> {
  const TermsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'termsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$termsViewModelHash();

  @$internal
  @override
  TermsViewModel create() => TermsViewModel();
}

String _$termsViewModelHash() => r'630a57b00273acc394b3023121b1535602495d80';

abstract class _$TermsViewModel extends $AsyncNotifier<List<TermsModel>> {
  FutureOr<List<TermsModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<TermsModel>>, List<TermsModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TermsModel>>, List<TermsModel>>,
              AsyncValue<List<TermsModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
