import 'package:auth_test_task/data/data_source/local/local_storage_service.dart';
import 'package:auth_test_task/domain/use_cases/auth/use_case_login.dart';
import 'package:auth_test_task/domain/utils/auth/auth_password.dart';
import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  final UseCaseLogin _useCaseLogin;
  LoginViewModel(this._useCaseLogin);

  String _email = '';
  String _password = '';
  bool _isLoading = false;
  String? _errorText;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorText => _errorText;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<bool> login() async {
    if (_email.isEmpty || _password.isEmpty) {
      _errorText = 'Please fill all fields';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorText = null;
    notifyListeners();

    try {
      final user = await LocalStorageService.getUserByEmail(_email);
      if (user == null) {
        _errorText = 'User not found';
        notifyListeners();
        return false;
      }

      final isVerifiedPassword = AuthPasswordService.verifyPassword(
        _password,
        user.passwordHash,
        user.salt,
      );
      if (!isVerifiedPassword) {
        _errorText = 'Incorrect password';
        notifyListeners();
        return false;
      }

      await _useCaseLogin.execute();

      return true;
    } catch (e) {
      _errorText = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    return false;
  }
}
