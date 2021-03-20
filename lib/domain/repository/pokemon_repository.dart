import 'package:clean_architecture/domain/model/pokemon_model.dart';
import 'package:flutter/foundation.dart';

abstract class PokemonRepository{
  Future<PokemonModel> getPokemon({@required int id});

  Future<PokemonModel> getPokemonByName({@required String name});
}