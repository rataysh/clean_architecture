import 'package:flutter/material.dart';
import 'package:auth_test_task/data/repositories/auth/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  bool _isAuthenticated = false;
  bool _isLoading = false;

  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;

  AuthProvider(this._authRepository) {
    _checkUserStatus();
  }

  Future<void> _checkUserStatus() async {
    _isLoading = true;
    notifyListeners();

    try {
      bool isLoggedIn = await _authRepository.isAuthenticated();
      _isAuthenticated = isLoggedIn;
    } catch (e) {
      debugPrint('Error checking auth status: $e');
      _isAuthenticated = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authRepository.login();
      _isAuthenticated = true;
    } catch (e) {
      debugPrint('Login error: $e');
      _isAuthenticated = false;
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authRepository.logout();
      _isAuthenticated = false;
    } catch (e) {
      debugPrint('Logout error: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
