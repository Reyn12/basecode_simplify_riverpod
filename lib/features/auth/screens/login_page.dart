import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../widget/custom_text_field.dart';
import '../providers/auth_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.listen(loginControllerProvider, (previous, next) {
      if (!next.hasValue) return;
      final token = next.value;
      if (token == null) return;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        context.go('/');
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginControllerProvider);

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
      body: _LoginForm(
        formKey: formKey,
        emailController: emailController,
        passwordController: passwordController,
        errorText: loginState.hasError ? loginState.error.toString() : null,
        isLoading: loginState.isLoading,
        onSubmit: (email, password) {
          ref
              .read(loginControllerProvider.notifier)
              .login(email: email, password: password);
        },
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    this.errorText,
    this.isLoading = false,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function(String email, String password) onSubmit;
  final String? errorText;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            if (errorText != null) ...[
              Text(
                errorText!,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.error),
              ),
              const SizedBox(height: 12),
            ],
            CustomTextField(
              name: 'email',
              label: 'Email',
              hint: 'Masukkan email',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Email wajib diisi';
                }
                if (!v.contains('@')) return 'Email tidak valid';
                return null;
              },
            ),
            const SizedBox(height: 12),
            CustomTextField.password(
              name: 'password',
              label: 'Password',
              hint: 'Masukkan password',
              controller: passwordController,
              isRequired: true,
              validator: (v) {
                if (v == null || v.trim().isEmpty) {
                  return 'Password wajib diisi';
                }
                if (v.trim().length < 6) {
                  return 'Password minimal 6 karakter';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                  final ok = formKey.currentState?.validate() ?? false;
                  if (!ok) return;
                  onSubmit(emailController.text.trim(), passwordController.text);
                },
                child: isLoading
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

