import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../network/api_service.dart';
import '../models/auth_token.dart';

part 'auth_provider.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<AuthToken?> build() => null;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(apiServiceProvider).login(
            email: email,
            password: password,
          ),
    );
  }
}

