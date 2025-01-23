import 'package:auth_test_task/domain/models/user_model.dart';

abstract class AuthService {
  Future<bool> isAuthenticated();
  Future<void> login(String email, String password);
  Future<void> logout();
  Future<void> checkDuplicateEmail(String email);
  Future<void> saveUser(UserModel user);
}
