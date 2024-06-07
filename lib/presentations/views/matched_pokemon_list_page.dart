import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_match/constants/app_sizes.dart';
import 'package:poke_match/core/state/matched_pokemon_provider.dart';

class MatchedPokemonListPage extends ConsumerWidget {
  const MatchedPokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchedPokemonState = ref.watch(matchedPokemonProviderProvider);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              surfaceTintColor: Colors.transparent,
              floating: true,
              flexibleSpace: const FlexibleSpaceBar(
                title: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.p12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Matched!!'),
                  ),
                ),
              ),
            ),
            SliverList.builder(
              itemCount: matchedPokemonState.length,
              itemBuilder: (BuildContext context, int index) {
                final pokemon = matchedPokemonState[index];
                return Container(
                  padding: const EdgeInsets.all(Sizes.p12),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Theme.of(context).dividerColor),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        pokemon.imageUrl,
                        height: Sizes.p48,
                        width: Sizes.p48,
                      ),
                      gapW16,
                      Text(pokemon.name),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
