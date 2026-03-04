// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_storage.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authStorage)
const authStorageProvider = AuthStorageProvider._();

final class AuthStorageProvider
    extends $FunctionalProvider<AuthStorage, AuthStorage, AuthStorage>
    with $Provider<AuthStorage> {
  const AuthStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStorageHash();

  @$internal
  @override
  $ProviderElement<AuthStorage> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthStorage create(Ref ref) {
    return authStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthStorage>(value),
    );
  }
}

String _$authStorageHash() => r'64bf4f4989b7d3d7910a5d3ec516b0b1934c12b4';
