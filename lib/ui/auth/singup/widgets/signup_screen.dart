import 'package:auth_test_task/ui/auth/singup/signup_provider.dart';
import 'package:auth_test_task/ui/auth/singup/widgets/signup_form.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthSignUp extends ConsumerWidget {
  const AuthSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupViewModel = ref.watch(signupViewModelProvider);

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
      body: Container(
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
      ),
    );
  }
}
