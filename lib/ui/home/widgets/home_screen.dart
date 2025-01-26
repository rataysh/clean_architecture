import 'package:auth_test_task/domain/services/auth/auth_provider.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:auth_test_task/ui/home/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = HomeViewModel(context.read<AuthProvider>());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: _Body(homeViewModel: homeViewModel),
    );
  }
}

class _Body extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const _Body({required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'You can see it if you are authenticated',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await homeViewModel.logout();
            NavigationService.replaceTo('/login');
          },
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
