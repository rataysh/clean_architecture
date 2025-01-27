import 'package:auth_test_task/domain/use_cases/auth/user_case_logout.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  final UseCaseLogout _useCaseLogout;

  HomeViewModel(this._useCaseLogout);

  Future<void> logout() async {
    await _useCaseLogout.execute();
    notifyListeners();
  }
}
