import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController emailController;
  final String? Function(String?) validator;

  const EmailInput({
    required this.emailController,
    required this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
      validator: validator,
    );
  }
}
