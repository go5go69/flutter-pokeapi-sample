import 'package:flutter_test/flutter_test.dart';
import 'package:poke_match/domain/models/pokemon.dart';

void main() {
  test('pokemon model fromJson creates a valid instance', () {
    Map<String, dynamic> json = {
      'id': 1,
      'name': 'Bulbasaur',
      'types': [
        {
          'type': {'name': 'grass'}
        },
        {
          'type': {'name': 'poison'}
        }
      ],
      'height': 70,
      'weight': 69,
      'sprites': {
        'other': {
          'official-artwork': {
            'front_default': 'http://example.com/bulbasaur.png'
          }
        }
      }
    };

    final result = Pokemon.fromJson(json);

    expect(result.id, 1);
    expect(result.name, 'Bulbasaur');
    expect(result.types, ['grass', 'poison']);
    expect(result.height, 7.0); // divideBy10 による変換結果
    expect(result.weight, 6.9); // divideBy10 による変換結果
    expect(result.imageUrl, 'http://example.com/bulbasaur.png');
  });
}
