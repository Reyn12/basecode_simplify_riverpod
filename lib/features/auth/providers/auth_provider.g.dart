// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LoginController)
final loginControllerProvider = LoginControllerProvider._();

final class LoginControllerProvider
    extends $AsyncNotifierProvider<LoginController, LoginResult?> {
  LoginControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loginControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loginControllerHash();

  @$internal
  @override
  LoginController create() => LoginController();
}

String _$loginControllerHash() => r'54e19093b19d5aa13ddcf6e291724551e3caa376';

abstract class _$LoginController extends $AsyncNotifier<LoginResult?> {
  FutureOr<LoginResult?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LoginResult?>, LoginResult?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LoginResult?>, LoginResult?>,
              AsyncValue<LoginResult?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
