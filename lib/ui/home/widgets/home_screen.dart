import 'package:auth_test_task/data/data_source/remote/random_number_api_service.dart';
import 'package:auth_test_task/data/repositories/random_number/random_number_repository_impl.dart';
import 'package:auth_test_task/domain/use_cases/random_number/use_case_random_number.dart';
import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:auth_test_task/ui/home/view_models/home_view_model.dart';
import 'package:auth_test_task/data/repositories/auth/auth_repository_impl.dart';
import 'package:auth_test_task/domain/use_cases/auth/user_case_logout.dart';
import 'package:auth_test_task/ui/home/widgets/api_section_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  void _onViewModelChanged() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    final authRepository = AuthRepositoryImpl();
    final useCaseLogout = UseCaseLogout(authRepository);

    final randomNumberApiService = RandomNumberApiService();
    final randomNumberRepository =
        RandomNumberRepositoryImpl(randomNumberApiService);
    final useCaseRandomNumber = UseCaseRandomNumber(randomNumberRepository);

    _viewModel = HomeViewModel(useCaseLogout, useCaseRandomNumber);
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
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _viewModel.logout();
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
              message: _viewModel.cloudFunctionMessage,
              isLoading: _viewModel.isLoadingCloudFunction,
              onPressed: () async {
                await _viewModel.fetchRandomNumberFromCloudFunction();
              },
            ),
            ApiSectionWidget(
              title: 'Cloud Run',
              description:
                  'Send a request to Cloud Run to get a random number.',
              message: _viewModel.cloudRunMessage,
              isLoading: _viewModel.isLoadingCloudRun,
              onPressed: () async {
                await _viewModel.fetchRandomNumberFromCloudRun();
              },
            ),
          ],
        ),
      ),
    );
  }
}
