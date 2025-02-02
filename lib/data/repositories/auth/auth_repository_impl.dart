import 'package:auth_test_task/data/data_source/local/local_storage_service.dart';
import 'package:auth_test_task/data/mappers/user_mapper.dart';
import 'package:auth_test_task/domain/entities/user_entity.dart';
import 'package:auth_test_task/domain/repositories/auth_repository_interface.dart';

class AuthRepositoryImpl implements AuthRepositoryInterface {
  @override
  Future<bool> isAuthenticated() {
    return LocalStorageService.getIsLoggedIn();
  }

  @override
  Future<void> login() {
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
  Future<void> saveUser(UserEntity user) {
    final userDTO = user.toDTO();
    return LocalStorageService.saveUser(userDTO);
  }
}
