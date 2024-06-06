import 'package:poke_match/data/repositories/pokemon_repository.dart';
import 'package:poke_match/domain/models/pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_model.g.dart';

@riverpod
class HomePageModel extends _$HomePageModel {
  @override
  Future<Pokemon> build() async {
    final pokemonRepository = ref.watch(pokemonRepositoryProvider);
    final pokemon = await pokemonRepository.getPokemonById('1');
    return pokemon;
  }
}
