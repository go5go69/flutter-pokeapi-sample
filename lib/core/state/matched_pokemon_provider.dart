import 'package:poke_match/domain/models/pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'matched_pokemon_provider.g.dart';

@Riverpod(keepAlive: true)
class MatchedPokemonProvider extends _$MatchedPokemonProvider {
  @override
  List<Pokemon> build() => [];

  void addMatchedPokemon(Pokemon pokemon) {
    List<Pokemon> newList = List.from(state);
    newList.add(pokemon);
    state = newList;
  }

  /// test用にStateを返す
  List<Pokemon> debugState() {
    return state;
  }
}
