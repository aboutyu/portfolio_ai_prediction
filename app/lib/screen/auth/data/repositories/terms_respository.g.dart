// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_respository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(termsRepository)
const termsRepositoryProvider = TermsRepositoryProvider._();

final class TermsRepositoryProvider
    extends
        $FunctionalProvider<TermsRepository, TermsRepository, TermsRepository>
    with $Provider<TermsRepository> {
  const TermsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'termsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$termsRepositoryHash();

  @$internal
  @override
  $ProviderElement<TermsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TermsRepository create(Ref ref) {
    return termsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TermsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TermsRepository>(value),
    );
  }
}

String _$termsRepositoryHash() => r'8441bdb5b7cc70fa1b8f7dbcc3b3fcbbec2b9fae';
