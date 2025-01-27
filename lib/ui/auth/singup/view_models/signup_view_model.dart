import 'package:auth_test_task/data/repositories/auth/auth_repository_impl.dart';
import 'package:auth_test_task/domain/models/user_model.dart';
import 'package:auth_test_task/domain/utils/auth/auth_password.dart';
import 'package:auth_test_task/domain/utils/auth/auth_validation.dart';
import 'package:flutter/foundation.dart';

class SignupViewModel extends ChangeNotifier {
  static const String errorFillFields = 'Please fill all fields';
  static const String errorInvalidEmail = 'Invalid email';
  static const String errorInvalidPassword = 'Invalid password';
  static const String errorUserExists = 'User already exists';
  static const String errorGeneral = 'Error';

  String _email = '';
  String _password = '';
  String? _errorText;

  String get email => _email;
  String get password => _password;
  String? get errorText => _errorText;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  Future<bool> signup() async {
    if (!_validateInputs()) {
      notifyListeners();
      return false;
    }

    if (await _checkUserExists()) {
      notifyListeners();
      return false;
    }

    return await _createUser();
  }

  bool _validateInputs() {
    if (_email.isEmpty || _password.isEmpty) {
      _errorText = errorFillFields;
      return false;
    }

    if (AuthValidation.emailValidation(_email) != null) {
      _errorText = errorInvalidEmail;
      return false;
    }

    if (AuthValidation.passwordValidation(_password) != null) {
      _errorText = errorInvalidPassword;
      return false;
    }

    return true;
  }

  Future<bool> _checkUserExists() async {
    final result = await AuthRepositoryImpl().checkDuplicateEmail(_email);
    if (result) {
      _errorText = errorUserExists;
      return true;
    }
    return false;
  }

  Future<bool> _createUser() async {
    try {
      final salt = AuthPasswordService.generateSalt();
      final passwordHash =
          AuthPasswordService.hashPassword(_password, salt: salt);

      await AuthRepositoryImpl().saveUser(
        UserModel(
            uid: _email + _password,
            email: _email,
            salt: salt,
            passwordHash: passwordHash),
      );
      await AuthRepositoryImpl().login();
      return true;
    } catch (e) {
      _errorText = errorGeneral;
      return false;
    } finally {
      notifyListeners();
    }
  }
}
