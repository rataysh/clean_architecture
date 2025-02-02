import 'package:auth_test_task/domain/entities/random_number_entity.dart';

abstract class RandomNumberRepositoryInterface {
  Future<RandomNumberEntity> getRandomNumberFromCloudFunction();
  Future<RandomNumberEntity> getRandomNumberFromCloudRun();
}
