import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_match/constants/app_sizes.dart';
import 'package:poke_match/enums/swipe_direction.dart';

/// HomePage内の[PokemonCard]の上にStackして使用
class SwipeIndicator extends ConsumerWidget {
  final SwipeDirection? swipeDirection;
  const SwipeIndicator({super.key, required this.swipeDirection});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const horizontalPosition = 16.0;
    const topPosition = 8.0;
    switch (swipeDirection) {
      case SwipeDirection.up:
        return Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Sizes.appMaxWidth * 0.75,
            ),
            child: Image.asset(
              'assets/images/super_like.png',
              width: MediaQuery.of(context).size.width * 0.75,
            ),
          ),
        );
      case SwipeDirection.right:
        return Positioned(
          left: horizontalPosition,
          top: 8,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Sizes.appMaxWidth * 0.4,
            ),
            child: Image.asset(
              'assets/images/like.png',
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
        );
      case SwipeDirection.left:
        return Positioned(
          right: horizontalPosition,
          top: topPosition,
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: Sizes.appMaxWidth * 0.3,
            ),
            child: Image.asset(
              'assets/images/nope.png',
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
