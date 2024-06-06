import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  factory Pokemon({
    required int id,
    required String name,
    required List<String> types,
    required double height,
    required double weight,
    required String imageUrl,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
}

// typesToListとdivideBy10のカスタム関数を使ってfreezedのfromJsonを拡張
Pokemon _$PokemonModelFromJson(Map<String, dynamic> json) {
  List<String> typesToList(dynamic types) {
    List<String> res = [];
    for (int i = 0; i < types.length; i++) {
      res.add(types[i]['type']['name']);
    }
    return res;
  }

  double divideBy10(dynamic num) {
    return num / 10;
  }

  return Pokemon(
    id: json['id'],
    name: json['name'],
    types: typesToList(json['types']),
    height: divideBy10(json['height']),
    weight: divideBy10(json['weight']),
    imageUrl: json['sprites']['other']['official-artwork']['front_default'],
  );
}
