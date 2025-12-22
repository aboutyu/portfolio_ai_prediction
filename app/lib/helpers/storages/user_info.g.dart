// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserInfo)
const userInfoProvider = UserInfoProvider._();

final class UserInfoProvider
    extends $AsyncNotifierProvider<UserInfo, LoginResponse?> {
  const UserInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userInfoProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userInfoHash();

  @$internal
  @override
  UserInfo create() => UserInfo();
}

String _$userInfoHash() => r'53e5f06f70c241e7fc5c43a322eb78c39a084206';

abstract class _$UserInfo extends $AsyncNotifier<LoginResponse?> {
  FutureOr<LoginResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LoginResponse?>, LoginResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LoginResponse?>, LoginResponse?>,
              AsyncValue<LoginResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
