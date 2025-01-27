import 'package:auth_test_task/domain/repositories/auth_repository_interface.dart';

class UseCaseIsAuthenticated {
  final AuthRepositoryInterface _repository;

  UseCaseIsAuthenticated(this._repository);

  Future<bool> execute() async {
    return await _repository.isAuthenticated();
  }
}
