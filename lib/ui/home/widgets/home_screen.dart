import 'package:auth_test_task/routing/navigation/navigation_service.dart';
import 'package:auth_test_task/ui/home/view_models/home_view_model.dart';
import 'package:auth_test_task/data/repositories/auth/auth_repository_impl.dart';
import 'package:auth_test_task/domain/use_cases/auth/user_case_logout.dart';
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
    _viewModel = HomeViewModel(useCaseLogout);
    _viewModel.addListener(_onViewModelChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text(
          'You can see it if you are authenticated',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await _viewModel.logout();
            NavigationService.replaceTo('/login');
          },
          child: const Icon(Icons.logout)),
    );
  }
}
