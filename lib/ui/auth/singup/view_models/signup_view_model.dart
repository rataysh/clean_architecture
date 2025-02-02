import 'package:auth_test_task/domain/entities/user_entity.dart';
import 'package:auth_test_task/domain/use_cases/auth/use_case_check_duplicate_email.dart';
import 'package:auth_test_task/domain/use_cases/auth/use_case_sign_up.dart';
import 'package:auth_test_task/domain/utils/auth/auth_password.dart';
import 'package:auth_test_task/domain/utils/auth/auth_validation.dart';
import 'package:flutter/foundation.dart';

class SignupViewModel extends ChangeNotifier {
  final UseCaseCheckDuplicateEmail _useCaseCheckDuplicateEmail;
  final UseCaseSignUp _useCaseSignUp;
  SignupViewModel(this._useCaseCheckDuplicateEmail, this._useCaseSignUp);

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
    final result = await _useCaseCheckDuplicateEmail.execute(_email);
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

      await _useCaseSignUp.execute(
        UserEntity(
            uid: _email + _password,
            email: _email,
            salt: salt,
            passwordHash: passwordHash),
      );
      return true;
    } catch (e) {
      _errorText = errorGeneral;
      return false;
    } finally {
      notifyListeners();
    }
  }
}
