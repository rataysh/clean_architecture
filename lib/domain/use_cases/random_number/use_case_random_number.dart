import 'package:auth_test_task/domain/models/random_number_model.dart';
import 'package:auth_test_task/domain/repositories/random_number_repository_interface.dart';

class UseCaseRandomNumber {
  final RandomNumberRepositoryInterface _repository;

  UseCaseRandomNumber(this._repository);

  Future<RandomNumberModel> executeFromCloudFunction() async {
    return await _repository.getRandomNumberFromCloudFunction();

  }

  Future<RandomNumberModel> executeFromCloudRun() async {
    return await _repository.getRandomNumberFromCloudRun();
  }
}
