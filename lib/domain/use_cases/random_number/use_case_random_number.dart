import 'package:auth_test_task/domain/entities/random_number_entity.dart';
import 'package:auth_test_task/domain/repositories/random_number_repository_interface.dart';

class UseCaseRandomNumber {
  final RandomNumberRepositoryInterface _repository;

  UseCaseRandomNumber(this._repository);

  Future<RandomNumberEntity> executeFromCloudFunction() async {
    return await _repository.getRandomNumberFromCloudFunction();
  }

  Future<RandomNumberEntity> executeFromCloudRun() async {
    return await _repository.getRandomNumberFromCloudRun();
  }
}
