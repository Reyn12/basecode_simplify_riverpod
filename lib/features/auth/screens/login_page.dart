import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widget/custom_text_field.dart';
import '../../../widget/dialog_mixin.dart';
import '../../../widget/primary_button.dart';
import '../models/login_result.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> with DialogMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginControllerProvider);

    listenAction<LoginResult>(
      context: context,
      state: loginState,
      onSuccess: () {
        if (!mounted) return;
        context.go('/products');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // TODO: navigasi ke halaman sebelumnya.
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              name: 'email',
              label: 'Email',
              hint: 'Masukkan email',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              isRequired: false,
            ),
            const SizedBox(height: 12),
            CustomTextField.password(
              name: 'password',
              label: 'Password',
              hint: 'Masukkan password',
              controller: passwordController,
              isRequired: false,
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              enabled: !loginState.isLoading,
              text: 'Login',
              color: const Color(0xFF0D47A1),
              textColor: Colors.white,
              onPressed: () {
                ref.read(loginControllerProvider.notifier).login(
                      email: emailController.text.trim(),
                      password: passwordController.text,
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}

