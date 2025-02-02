import 'package:auth_test_task/providers/auth_provider.dart';
import 'package:auth_test_task/ui/auth/login/widgets/login_screen.dart';
import 'package:auth_test_task/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationCheck extends ConsumerWidget {
  const AuthenticationCheck({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the global authStatusProvider
    final authStatusAsyncValue = ref.watch(authStatusProvider);
    return authStatusAsyncValue.when(
      data: (isLoggedIn) =>
          isLoggedIn ? const HomeScreen() : const LoginScreen(),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
    );
  }
}
