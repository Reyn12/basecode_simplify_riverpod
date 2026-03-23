import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

import '../../../network/api_service.dart';
import '../models/login_result.dart';
import '../storage/auth_storage.dart';

part 'auth_provider.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<LoginResult?> build() => null;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    await Future<void>.delayed(const Duration(milliseconds: 500));
    state = await AsyncValue.guard(
      () async {
        final result = await ref.read(apiServiceProvider).login(
              email: email,
              password: password,
            );
        await AuthStorage().saveLogin(result);
        return result;
      },
    );
  }
}

