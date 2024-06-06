import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_match/constants/app_sizes.dart';
import 'package:poke_match/presentations/view_models/home_page_model.dart';
import 'package:poke_match/presentations/views/widgets/app_icon_button.dart';
import 'package:poke_match/presentations/views/widgets/pokemon_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = switch (ref.watch(homePageModelProvider)) {
      AsyncData(:final value) => value,
      _ => null,
    };
    
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/poke_match_logo.png',
          width: MediaQuery.sizeOf(context).width * 0.5,
        ),
      ),
      body: pageState == null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
          child: Column(
            children: [
              gapH8,
              PokemonCard(
                      name: pageState.name,
                      imageUrl: pageState.imageUrl,
                      types: pageState.types,
                      height: pageState.height,
                      weight: pageState.weight,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppIconButton(
                      color: Colors.redAccent,
                      icon: Icons.heart_broken_rounded,
                      onTap: () {},
                    ),
                    AppIconButton(
                      color: Colors.greenAccent,
                      icon: Icons.favorite_rounded,
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
