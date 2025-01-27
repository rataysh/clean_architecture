import 'package:auth_test_task/data/data_source/remote/random_number_api_service.dart';
import 'package:auth_test_task/domain/models/random_number_model.dart';
import 'package:auth_test_task/domain/repositories/random_number_repository_interface.dart';
import 'package:dio/dio.dart';

class RandomNumberRepositoryImpl implements RandomNumberRepositoryInterface {
  final RandomNumberApiService _apiService;

  RandomNumberRepositoryImpl(this._apiService);

  @override
  Future<RandomNumberModel> getRandomNumberFromCloudFunction() async {
    try {
      final response = await _apiService.getRandomNumberFromCloudFunction();
      // First aproach
      final Map<String, dynamic> data = {'randomValue': response.data};
      return RandomNumberModel.fromJson(data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  @override
  Future<RandomNumberModel> getRandomNumberFromCloudRun() async {
    try {
      final response = await _apiService.getRandomNumberFromCloudRun();
      // Second aproach
      return RandomNumberModel.fromString(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
