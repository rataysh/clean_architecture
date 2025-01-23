import 'package:auth_test_task/data/local/local_storage_service.dart';
import 'package:auth_test_task/domain/models/user_model.dart';
import 'package:auth_test_task/domain/services/auth/auth_service.dart';

class AuthRepository extends AuthService {
  @override
  Future<bool> isAuthenticated() {
    return LocalStorageService.getIsLoggedIn();
  }

  @override
  Future<void> login(String email, String password) {
    return LocalStorageService.setIsLoggedIn(true);
  }

  @override
  Future<void> logout() {
    return LocalStorageService.setIsLoggedIn(false);
  }

  @override
  Future<bool> checkDuplicateEmail(String email) async {
    final users = await LocalStorageService.getUsers();
    return users.any((user) => user.email == email);
  }

  @override
  Future<void> saveUser(UserModel user) {
    return LocalStorageService.saveUser(user);
  }
}
