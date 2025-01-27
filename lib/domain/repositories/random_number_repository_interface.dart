import 'package:auth_test_task/domain/models/random_number_model.dart';

abstract class RandomNumberRepositoryInterface {
  Future<RandomNumberModel> getRandomNumberFromCloudFunction();
  Future<RandomNumberModel> getRandomNumberFromCloudRun();
}
