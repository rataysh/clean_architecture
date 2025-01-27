// lib/ui/home/widgets/api_section_widget.dart

import 'package:flutter/material.dart';

class ApiSectionWidget extends StatelessWidget {
  final String title;
  final String description;
  final String message;
  final bool isLoading;
  final VoidCallback onPressed;

  const ApiSectionWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.message,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(description),
              const SizedBox(height: 16),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Text(message),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: isLoading ? null : onPressed,
                  child: const Text('Send Request'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
