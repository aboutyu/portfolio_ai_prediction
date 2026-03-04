// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faq_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(faqRepository)
const faqRepositoryProvider = FaqRepositoryProvider._();

final class FaqRepositoryProvider
    extends $FunctionalProvider<FaqRepository, FaqRepository, FaqRepository>
    with $Provider<FaqRepository> {
  const FaqRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faqRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faqRepositoryHash();

  @$internal
  @override
  $ProviderElement<FaqRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FaqRepository create(Ref ref) {
    return faqRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaqRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaqRepository>(value),
    );
  }
}

String _$faqRepositoryHash() => r'eb27e1139a3233b794139a0fd113c747962f59e5';

@ProviderFor(faqCategoriesRepository)
const faqCategoriesRepositoryProvider = FaqCategoriesRepositoryProvider._();

final class FaqCategoriesRepositoryProvider
    extends
        $FunctionalProvider<
          FaqCategoriesRepository,
          FaqCategoriesRepository,
          FaqCategoriesRepository
        >
    with $Provider<FaqCategoriesRepository> {
  const FaqCategoriesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'faqCategoriesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$faqCategoriesRepositoryHash();

  @$internal
  @override
  $ProviderElement<FaqCategoriesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FaqCategoriesRepository create(Ref ref) {
    return faqCategoriesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FaqCategoriesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FaqCategoriesRepository>(value),
    );
  }
}

String _$faqCategoriesRepositoryHash() =>
    r'61b591f9c96eec2719ce6781cbb2466b7696617c';
