import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:poke_match/core/state/id_list.dart';
import 'package:poke_match/data/repositories/pokemon_repository.dart';
import 'package:poke_match/domain/models/pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_model.g.dart';

@riverpod
class HomePageViewModel extends _$HomePageViewModel {
  @override
  Future<List<Pokemon>> build() async {
    final pokemonRepository = ref.watch(pokemonRepositoryProvider);
    final idListState = ref.read(idListProvider);
    final idListNotifier = ref.read(idListProvider.notifier);

    List<Pokemon> list = [];
    for (int i = 0; i < 5; i++) {
      final pokemon =
          await pokemonRepository.getPokemonById(idListState[i].toString());
      list.add(pokemon);
      idListNotifier.remove();
    }
    return list;
  }

  final swipeController = AppinioSwiperController();
}
