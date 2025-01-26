import 'package:auth_test_task/domain/services/auth/auth_provider.dart';
import 'package:auth_test_task/ui/auth/login/view_models/login_view_model.dart';
import 'package:auth_test_task/ui/auth/login/widgets/login_form.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = LoginViewModel(context.read<AuthProvider>());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Login'),
      ),
      body: _Body(loginViewModel: loginViewModel),
    );
  }
}

class _Body extends StatelessWidget {
  final LoginViewModel loginViewModel;
  const _Body({required this.loginViewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginForm(
              onSubmit: (email, password) async {
                loginViewModel.setEmail(email);
                loginViewModel.setPassword(password);
                final loginResult = await loginViewModel.login();
                if (loginResult == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(loginViewModel.errorText ?? 'Error'),
                    ),
                  );
                } else {
                  NavigationService.replaceTo('/home');
                }
              },
            ),
            const SizedBox(height: 20),
            ButtonTheme(
                child: ElevatedButton(
                    onPressed: () {
                      NavigationService.replaceTo('/signup');
                    },
                    child: const Text('Sign Up')))
          ]),
    );
  }
}
