import 'package:auth_test_task/data/repositories/auth/auth_repository_impl.dart';
import 'package:auth_test_task/domain/use_cases/auth/use_case_check_duplicate_email.dart';
import 'package:auth_test_task/domain/use_cases/auth/use_case_sign_up.dart';
import 'package:auth_test_task/ui/auth/singup/view_models/signup_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signupViewModelProvider = ChangeNotifierProvider<SignupViewModel>((ref) {
  final authRepository = AuthRepositoryImpl();
  final useCaseCheckDuplicateEmail = UseCaseCheckDuplicateEmail(authRepository);
  final useCaseSignUp = UseCaseSignUp(authRepository);
  return SignupViewModel(useCaseCheckDuplicateEmail, useCaseSignUp);
});
