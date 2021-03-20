
import 'package:clean_architecture/data/api/model/pokemon_api.dart';
import 'package:clean_architecture/data/api/service/pokemon_service.dart';
import 'package:clean_architecture/data/mapper/to_pokemon_mapper.dart';
import 'package:clean_architecture/domain/model/pokemon_model.dart';

class ApiUtil{
  PokemonService _pokemonService;
  ApiUtil(this._pokemonService);

  Future<ApiPokemon> getPokemon(int id)async{
    var pokemon = await _pokemonService.getPokemonByID(id);
    return pokemon;
  }
}