import 'package:auth_test_task/domain/repositories/auth_repository_interface.dart';

class UseCaseCheckDuplicateEmail {
  final AuthRepositoryInterface _repository;

  UseCaseCheckDuplicateEmail(this._repository);

  Future<bool> execute(String email) async {
    return await _repository.checkDuplicateEmail(email);
  }
}
