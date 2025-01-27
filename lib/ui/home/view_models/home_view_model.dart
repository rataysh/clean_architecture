import 'package:auth_test_task/domain/use_cases/auth/user_case_logout.dart';
import 'package:auth_test_task/domain/use_cases/random_number/use_case_random_number.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  final UseCaseLogout _useCaseLogout;
  final UseCaseRandomNumber _useCaseRandomNumber;

  HomeViewModel(this._useCaseLogout, this._useCaseRandomNumber);

  // States for Cloud Function
  String _cloudFunctionMessage =
      'Press the button to send a request to Cloud Function.';
  String get cloudFunctionMessage => _cloudFunctionMessage;
  bool _isLoadingCloudFunction = false;
  bool get isLoadingCloudFunction => _isLoadingCloudFunction;

  // States for Cloud Run
  String _cloudRunMessage = 'Press the button to send a request to Cloud Run.';
  String get cloudRunMessage => _cloudRunMessage;
  bool _isLoadingCloudRun = false;
  bool get isLoadingCloudRun => _isLoadingCloudRun;

  Future<void> logout() async {
    await _useCaseLogout.execute();
    notifyListeners();
  }

  Future<void> fetchRandomNumberFromCloudFunction() async {
    _isLoadingCloudFunction = true;
    notifyListeners();
    try {
      final randomNumber =
          await _useCaseRandomNumber.executeFromCloudFunction();
      _cloudFunctionMessage =
          'Result from Cloud Function: ${randomNumber.randomValue}';
    } catch (e) {
      _cloudFunctionMessage = 'Error fetching from Cloud Function: $e';
    } finally {
      _isLoadingCloudFunction = false;
      notifyListeners();
    }
  }

  Future<void> fetchRandomNumberFromCloudRun() async {
    _isLoadingCloudRun = true;
    notifyListeners();
    try {
      final randomNumber = await _useCaseRandomNumber.executeFromCloudRun();
      _cloudRunMessage = 'Result from Cloud Run: ${randomNumber.randomValue}';
    } catch (e) {
      _cloudRunMessage = 'Error fetching from Cloud Run: $e';
    } finally {
      _isLoadingCloudRun = false;
      notifyListeners();
    }
  }
}
