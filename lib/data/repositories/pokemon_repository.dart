import 'package:poke_match/data/services/api_service.dart';
import 'package:poke_match/domain/models/pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_repository.g.dart';

class PokemonRepository {
  final ApiService _apiService;

  PokemonRepository(this._apiService);

  Future<Pokemon> getPokemonById(String id) async {
    final json = await _apiService.getPokemonById(id);
    return Pokemon.fromJson(json);
  }
}

@Riverpod(keepAlive: true)
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) {
  return PokemonRepository(ref.watch(apiServiceProvider));
}
