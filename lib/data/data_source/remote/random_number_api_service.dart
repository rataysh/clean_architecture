import 'package:dio/dio.dart';

class RandomNumberApiService {
  final Dio _dio;
  RandomNumberApiService({Dio? dio}) : _dio = dio ?? Dio();

  Future<Response> getRandomNumberFromCloudRun() async {
    try {
      final response = await _dio.get(
        'https://us-central1-literaturequizeng-c428a.cloudfunctions.net/random_number',
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }

  Future<Response> getRandomNumberFromCloudFunction() async {
    try {
      final response = await _dio.get(
        'https://fastapi-number-app-943414542474.us-central1.run.app/random_number',
      );
      return response;
    } on DioException catch (e) {
      throw e;
    }
  }
}
