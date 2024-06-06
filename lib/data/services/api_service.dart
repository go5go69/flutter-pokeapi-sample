import 'package:poke_match/constants/app_strings.dart';
import 'package:poke_match/core/network/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service.g.dart';

class ApiService {
  const ApiService(this._dioClient);
  final DioClient _dioClient;

  Future<Map<String, dynamic>> getPokemonById(String id) async {
    final response = await _dioClient.get('${AppStrings.pokemonEp}/$id');
    return response.data;
  }
}

@Riverpod(keepAlive: true)
ApiService apiService(ApiServiceRef ref) {
  return ApiService(DioClient());
}
