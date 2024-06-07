import 'package:flutter/material.dart';
import 'package:poke_match/constants/app_sizes.dart';
import 'package:poke_match/constants/app_strings.dart';
import 'package:poke_match/presentations/views/widgets/app_icon_button.dart';

class PokemonCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final List<String> types;
  final double height;
  final double weight;
  const PokemonCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.types,
    required this.height,
    required this.weight,
  });
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.p16),
      child: Container(
        width: double.infinity,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ポケモンの情報を表示
            Padding(
              padding: const EdgeInsets.all(Sizes.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Wrap(
                    spacing: Sizes.p8,
                    children: [
                      for (String type in types) ...{
                        Chip(
                          padding: const EdgeInsets.all(Sizes.p4),
                          label: Text(type),
                        )
                      }
                    ],
                  ),
                  Text('${AppStrings.height}: $height${AppStrings.heightUnit}'),
                  Text('${AppStrings.weight}: $weight${AppStrings.weightUnit}'),
                ],
              ),
            ),

            // ボタンウィジェット
            // [Nope, SuperLike, Like]
            Container(
              padding: const EdgeInsets.only(
                left: Sizes.p8,
                top: Sizes.p20,
                right: Sizes.p8,
                bottom: Sizes.p16,
              ),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: <Color>[
                    Colors.black38,
                    Colors.transparent,
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppIconButton(
                    color: Colors.redAccent,
                    icon: Icons.heart_broken_rounded,
                    onTap: () {},
                  ),
                  AppIconButton(
                    color: Colors.blueAccent,
                    icon: Icons.star_rounded,
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
    );
  }
}
