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
    extends $AsyncNotifierProvider<LoginController, AuthToken?> {
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

String _$loginControllerHash() => r'c33a2b9ebdcf212b016676c2df9beb19abd940b9';

abstract class _$LoginController extends $AsyncNotifier<AuthToken?> {
  FutureOr<AuthToken?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthToken?>, AuthToken?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthToken?>, AuthToken?>,
              AsyncValue<AuthToken?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
