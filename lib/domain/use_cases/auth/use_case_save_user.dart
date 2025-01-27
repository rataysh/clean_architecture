import 'package:auth_test_task/domain/models/user_model.dart';
import 'package:auth_test_task/domain/repositories/auth_repository_interface.dart';

class UseCaseSaveUser {
  final AuthRepositoryInterface _repository;

  UseCaseSaveUser(this._repository);

  Future<void> execute(UserModel user) async {
    return await _repository.saveUser(user);
  }
}
