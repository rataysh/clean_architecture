import 'package:auth_test_task/domain/entities/user_entity.dart';

abstract class AuthRepositoryInterface {
  Future<bool> isAuthenticated();
  Future<void> login();
  Future<void> logout();
  Future<bool> checkDuplicateEmail(String email);
  Future<void> saveUser(UserEntity user);
}
