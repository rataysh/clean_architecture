import 'package:auth_test_task/ui/auth/login/view_models/login_view_model.dart';
import 'package:auth_test_task/ui/auth/login/widgets/login_form.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginViewModel _viewModel;

  void _onViewModelChanged() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel();
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
                  _viewModel.setEmail(email);
                  _viewModel.setPassword(password);
                  final loginResult = await _viewModel.login();
                  if (loginResult == false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(_viewModel.errorText ?? 'Error'),
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
