import 'package:auth_test_task/domain/services/auth/auth_provider.dart';
import 'package:auth_test_task/ui/auth/singup/view_models/signup_view_model.dart';
import 'package:auth_test_task/ui/auth/singup/widgets/signup_form.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthSignUp extends StatelessWidget {
  const AuthSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final signupViewModel = SignupViewModel(context.read<AuthProvider>());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Sign Up'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            NavigationService.goBack();
          },
        ),
      ),
      body: _Body(signupViewModel: signupViewModel),
    );
  }
}

class _Body extends StatelessWidget {
  final SignupViewModel signupViewModel;
  const _Body({required this.signupViewModel});

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
            SignupForm(onSubmit: (email, password) async {
              signupViewModel.setEmail(email);
              signupViewModel.setPassword(password);
              final signupResult = await signupViewModel.signup();
              if (signupResult == false) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(signupViewModel.errorText ?? 'Error'),
                  ),
                );
              } else {
                NavigationService.replaceTo('/home');
              }
            }),
          ]),
    );
  }
}
