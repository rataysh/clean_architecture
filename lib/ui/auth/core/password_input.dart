import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController passwordController;
  final String? Function(String?) passwordValidator;
  final bool isPasswordVisible;
  final VoidCallback onVisibilityToggle;

  const PasswordInput({
    required this.passwordController,
    required this.passwordValidator,
    required this.isPasswordVisible,
    required this.onVisibilityToggle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: onVisibilityToggle,
        ),
      ),
      validator: passwordValidator,
      obscureText: !isPasswordVisible,
    );
  }
}
