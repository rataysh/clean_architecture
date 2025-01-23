import 'package:auth_test_task/data/repositories/auth/auth_repository.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  Future<void> logout() async {
    await AuthRepository().logout();
  }
}
