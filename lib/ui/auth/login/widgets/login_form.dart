import 'package:auth_test_task/domain/utils/auth/auth_validation.dart';
import 'package:auth_test_task/ui/auth/core/email_input.dart';
import 'package:auth_test_task/ui/auth/core/password_input.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final Function(String email, String password) onSubmit;

  const LoginForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(
        _emailController.text,
        _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailInput(
              emailController: _emailController,
              validator: AuthValidation.emailValidation),
          const SizedBox(height: 20),
          PasswordInput(
            passwordController: _passwordController,
            passwordValidator: AuthValidation.passwordValidation,
            isPasswordVisible: _isPasswordVisible,
            onVisibilityToggle: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
          const SizedBox(height: 20),
          ButtonTheme(
              child: ElevatedButton(
                  onPressed: _submitForm, child: const Text('Log In'))),
        ],
      ),
    );
  }
}
