import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_match/constants/app_sizes.dart';
import 'package:poke_match/enums/swipe_direction.dart';
import 'package:poke_match/presentations/view_models/home_page_view_model.dart';
import 'package:poke_match/presentations/views/widgets/pokemon_card.dart';
import 'package:poke_match/presentations/views/widgets/swipe_indicator.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = switch (ref.watch(homePageViewModelProvider)) {
      AsyncData(:final value) => value,
      _ => null,
    };
    final pageNotifier = ref.read(homePageViewModelProvider.notifier);

    final ValueNotifier<Offset?> initialTapPosition = useState(null);

    final ValueNotifier<SwipeDirection?> swipeDirection = useState(null);

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
                            // threshold: MediaQuery.sizeOf(context).width * 0.25,
                            onCardPositionChanged: (position) {
                              initialTapPosition.value ??= position.offset;
                              var currentPosition = position.offset;
                              var relativeX = initialTapPosition.value!.dx -
                                  currentPosition.dx;
                              var relativeY = initialTapPosition.value!.dy -
                                  currentPosition.dy;
                              if (relativeX.abs() > relativeY.abs()) {
                                if (relativeX < 0) {
                                  swipeDirection.value = SwipeDirection.right;
                                } else {
                                  swipeDirection.value = SwipeDirection.left;
                                }
                              } else {
                                if (relativeY < 0) {
                                  swipeDirection.value = SwipeDirection.left;
                                } else if (relativeY > 5) {
                                  swipeDirection.value = SwipeDirection.up;
                                }
                              }
                            },
                            onSwipeEnd: (previousIndex, targetIndex, activity) {
                              initialTapPosition.value = null;
                              swipeDirection.value = null;
                              pageNotifier.onSwipeEnd(
                                context,
                                previousIndex,
                                targetIndex,
                                activity,
                              );
                            },
                            cardBuilder: (context, index) {
                              final pokemon = pageState[index];
                              return Stack(
                                children: [
                                  PokemonCard(
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
                                  ),
                                  index == pageNotifier.swipeCount + 1
                                      ? const SizedBox.shrink()
                                      : SwipeIndicator(
                                          swipeDirection: swipeDirection.value,
                                        ),
                                ],
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
