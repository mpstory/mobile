import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_controller.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(loginControllerProvider);
    final controller = ref.read(loginControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: status == AuthStatus.loading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () => controller.login(),
                child: const Text('Login'),
              ),
      ),
    );
  }
}
