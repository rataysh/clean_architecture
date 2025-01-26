import 'package:auth_test_task/ui/auth/singup/view_models/signup_view_model.dart';
import 'package:auth_test_task/ui/auth/singup/widgets/signup_form.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class AuthSignUp extends StatefulWidget {
  const AuthSignUp({Key? key}) : super(key: key);

  @override
  _AuthSignUpState createState() => _AuthSignUpState();
}

class _AuthSignUpState extends State<AuthSignUp> {
  late final SignupViewModel _viewModel;

  void _onViewModelChanged() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _viewModel = SignupViewModel();
    _viewModel.addListener(_onViewModelChanged);
  }

  @override
  void dispose() {
    _viewModel.removeListener(_onViewModelChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                _viewModel.setEmail(email);
                _viewModel.setPassword(password);
                final signupResult = await _viewModel.signup();
                if (signupResult == false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_viewModel.errorText ?? 'Error'),
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
