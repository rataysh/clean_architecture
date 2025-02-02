import 'package:auth_test_task/data/data_source/remote/random_number_api_service.dart';
import 'package:auth_test_task/data/mappers/random_number_mapper.dart';
import 'package:auth_test_task/data/models/random_number_model.dart';
import 'package:auth_test_task/domain/entities/random_number_entity.dart';
import 'package:auth_test_task/domain/repositories/random_number_repository_interface.dart';
import 'package:dio/dio.dart';

class RandomNumberRepositoryImpl implements RandomNumberRepositoryInterface {
  final RandomNumberApiService _apiService;

  RandomNumberRepositoryImpl(this._apiService);

  @override
  Future<RandomNumberEntity> getRandomNumberFromCloudFunction() async {
    try {
      final response = await _apiService.getRandomNumberFromCloudFunction();
      // First aproach
      final Map<String, dynamic> data = {'randomValue': response.data};
      final randomNumberModel = RandomNumberModel.fromJson(data);
      return randomNumberModel.toDomain();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<RandomNumberEntity> getRandomNumberFromCloudRun() async {
    try {
      final response = await _apiService.getRandomNumberFromCloudRun();
      // Second aproach
      final randomNumberModel = RandomNumberModel.fromString(response.data);
      return randomNumberModel.toDomain();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
