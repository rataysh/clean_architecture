import 'package:auth_test_task/domain/models/user_model.dart';
import 'package:auth_test_task/domain/repositories/auth_repository_interface.dart';

class UseCaseSignUp {
  final AuthRepositoryInterface _repository;

  UseCaseSignUp(this._repository);

  // saveUser -> login
  Future<void> execute(UserModel user) async {
    await _repository.saveUser(user);
    return await _repository.login();
  }
}
