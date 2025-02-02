import 'package:auth_test_task/data/repositories/auth/auth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Global provider to check authentication status
final authStatusProvider = FutureProvider<bool>((ref) async {
  // Check authentication status using AuthRepositoryImpl
  final authRepository = AuthRepositoryImpl();
  return await authRepository.isAuthenticated();
});
