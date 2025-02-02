import 'package:auth_test_task/ui/auth/login/login_provider.dart';
import 'package:auth_test_task/ui/auth/login/widgets/login_form.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the loginViewModelProvider
    final loginViewModel = ref.watch(loginViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Login'),
      ),
      body: Container(
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
                        NavigationService.navigateTo('/signup');
                      },
                      child: const Text('Sign Up')))
            ]),
      ),
    );
  }
}
