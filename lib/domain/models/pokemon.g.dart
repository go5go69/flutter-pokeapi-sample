// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'types': instance.types,
      'height': instance.height,
      'weight': instance.weight,
      'imageUrl': instance.imageUrl,
    };
