import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'local_pokemon_model.g.dart';

@HiveType(typeId: 0)
class LocalPokemonModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String image;
  LocalPokemonModel({
    @required this.id,
    @required this.name,
    @required this.image,
  });
}
