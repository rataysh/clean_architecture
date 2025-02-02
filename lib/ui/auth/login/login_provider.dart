import 'package:auth_test_task/data/repositories/auth/auth_repository_impl.dart';
import 'package:auth_test_task/domain/use_cases/auth/use_case_login.dart';
import 'package:auth_test_task/ui/auth/login/view_models/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginViewModelProvider = ChangeNotifierProvider<LoginViewModel>((ref) {
  // Create LoginViewModel with its dependencies
  final authRepository = AuthRepositoryImpl();
  final useCaseLogin = UseCaseLogin(authRepository);
  return LoginViewModel(useCaseLogin);
});
