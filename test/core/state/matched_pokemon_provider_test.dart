import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poke_match/core/state/matched_pokemon_provider.dart';
import 'package:poke_match/domain/models/pokemon.dart';

void main() {
  test('addMatchedPokemon method test', () {
    final container = ProviderContainer();

    final notifier = container.read(matchedPokemonProviderProvider.notifier);

    final pokemon = Pokemon();

    notifier.build();

    // ビルド時はリストが空であるか
    expect(notifier.debugState(), isEmpty);

    // テスト対象メソッドの実行
    notifier.addMatchedPokemon(pokemon);

    // リストに追加したオブジェクトが存在するか
    expect(notifier.debugState(), contains(pokemon));

    // リストの要素が1であるか
    expect(notifier.debugState(), hasLength(1));
  });
}
