import 'package:auth_test_task/domain/services/auth/auth_provider.dart';
import 'package:auth_test_task/ui/auth/login/widgets/login_screen.dart';
import 'package:auth_test_task/ui/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationCheck extends StatelessWidget {
  const AuthenticationCheck({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    if (authProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (authProvider.isAuthenticated) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}
