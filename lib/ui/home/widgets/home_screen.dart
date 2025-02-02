import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:auth_test_task/ui/home/home_provider.dart';
import 'package:auth_test_task/ui/home/widgets/api_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await homeViewModel.logout();
              NavigationService.replaceTo('/login');
            },
            tooltip: 'Logout',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ApiSectionWidget(
              title: 'Cloud Function',
              description:
                  'Send a request to Cloud Function to get a random number.',
              message: homeViewModel.cloudFunctionMessage,
              isLoading: homeViewModel.isLoadingCloudFunction,
              onPressed: () async {
                await homeViewModel.fetchRandomNumberFromCloudFunction();
              },
            ),
            ApiSectionWidget(
              title: 'Cloud Run',
              description:
                  'Send a request to Cloud Run to get a random number.',
              message: homeViewModel.cloudRunMessage,
              isLoading: homeViewModel.isLoadingCloudRun,
              onPressed: () async {
                await homeViewModel.fetchRandomNumberFromCloudRun();
              },
            ),
          ],
        ),
      ),
    );
  }
}
