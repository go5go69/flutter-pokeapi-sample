import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_match/constants/app_sizes.dart';
import 'package:poke_match/presentations/view_models/home_page_view_model.dart';
import 'package:poke_match/presentations/views/widgets/pokemon_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = switch (ref.watch(homePageViewModelProvider)) {
      AsyncData(:final value) => value,
      _ => null,
    };
    final pageNotifier = ref.read(homePageViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/poke_match_logo.png',
          width: Sizes.appBarLogo,
        ),
      ),
      body: pageState == null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: Sizes.appMaxWidth,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
                    child: Column(
                      children: [
                        gapH8,
                        Flexible(
                          child: AppinioSwiper(
                            controller: pageNotifier.swipeController,
                            initialIndex: pageNotifier.swipeCount,
                            cardCount: pageState.length,
                            backgroundCardOffset: const Offset(0, 0),
                            // スワイプアニメーションをトリガーするためにパンしなければならない最小距離
                            threshold: MediaQuery.sizeOf(context).width * 0.25,
                            onSwipeEnd: (previousIndex, targetIndex, activity) {
                              pageNotifier.onSwipeEnd(
                                context,
                                previousIndex,
                                targetIndex,
                                activity,
                              );
                            },
                            cardBuilder: (context, index) {
                              final pokemon = pageState[index];
                              return PokemonCard(
                                name: pokemon.name,
                                imageUrl: pokemon.imageUrl,
                                types: pokemon.types,
                                height: pokemon.height,
                                weight: pokemon.weight,
                                onTapLNope: () async {
                                  pageNotifier.swipeController.swipeLeft();
                                },
                                onTapSuerLike: () async {
                                  pageNotifier.swipeController.swipeUp();
                                },
                                onTapLike: () async {
                                  pageNotifier.swipeController.swipeRight();
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
