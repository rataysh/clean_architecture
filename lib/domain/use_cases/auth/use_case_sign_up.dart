import 'package:auth_test_task/domain/entities/user_entity.dart';
import 'package:auth_test_task/domain/repositories/auth_repository_interface.dart';

class UseCaseSignUp {
  final AuthRepositoryInterface _repository;

  UseCaseSignUp(this._repository);

  // saveUser -> login
  Future<void> execute(UserEntity user) async {
    await _repository.saveUser(user);
    return await _repository.login();
  }
}
