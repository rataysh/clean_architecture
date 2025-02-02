import 'package:auth_test_task/data/data_source/remote/random_number_api_service.dart';
import 'package:auth_test_task/data/repositories/auth/auth_repository_impl.dart';
import 'package:auth_test_task/data/repositories/random_number/random_number_repository_impl.dart';
import 'package:auth_test_task/domain/use_cases/auth/user_case_logout.dart';
import 'package:auth_test_task/domain/use_cases/random_number/use_case_random_number.dart';
import 'package:auth_test_task/ui/home/view_models/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  final authRepository = AuthRepositoryImpl();
  final randomNumberApiService = RandomNumberApiService();
  final randomNumberRepositoryImpl =
      RandomNumberRepositoryImpl(randomNumberApiService);
  final useCaseLogout = UseCaseLogout(authRepository);
  final useCaseRandomNumber = UseCaseRandomNumber(randomNumberRepositoryImpl);

  return HomeViewModel(useCaseLogout, useCaseRandomNumber);
});
