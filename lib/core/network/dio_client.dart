import 'package:dio/dio.dart';
import 'package:poke_match/constants/app_strings.dart';

class DioClient {
  final dio = Dio(BaseOptions(baseUrl: AppStrings.baseUrl));

  Future<Response> get(String endpoint) async {
    try {
      return await dio.get(endpoint);
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
