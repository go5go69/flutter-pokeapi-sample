import 'package:flutter/material.dart';
import 'package:poke_match/constants/app_sizes.dart';
import 'package:poke_match/constants/app_strings.dart';

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
    return Container(
      padding: const EdgeInsets.all(Sizes.p12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.p16),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
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
    );
  }
}
