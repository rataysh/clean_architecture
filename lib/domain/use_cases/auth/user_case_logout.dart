import 'package:auth_test_task/domain/repositories/auth_repository_interface.dart';

class UseCaseLogout {
  final AuthRepositoryInterface _repository;

  UseCaseLogout(this._repository);

  Future<void> execute() async {
    return await _repository.logout();
  }
}
