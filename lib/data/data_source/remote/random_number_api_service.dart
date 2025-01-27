import 'package:auth_test_task/data/data_source/remote/api_service.dart';
import 'package:dio/dio.dart';

class RandomNumberApiService extends ApiService {
  RandomNumberApiService({Dio? dio}) : super(dio: dio);

  Future<Response> getRandomNumberFromCloudRun() async {
    return await getRequest(
        'https://us-central1-literaturequizeng-c428a.cloudfunctions.net/random_number');
  }

  Future<Response> getRandomNumberFromCloudFunction() async {
    return await getRequest(
        'https://fastapi-number-app-943414542474.us-central1.run.app/random_number');
  }
}