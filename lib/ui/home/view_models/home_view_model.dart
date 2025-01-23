import 'package:auth_test_task/domain/services/auth/auth_provider.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  final AuthProvider authProvider;
  HomeViewModel(this.authProvider);

  Future<void> logout() async {
    await authProvider.logout();
  }
}
