import 'package:clean_architecture/data/api/model/pokemon_api.dart';
import 'package:clean_architecture/data/local/model/local_pokemon_model.dart';
import 'package:clean_architecture/domain/model/pokemon_model.dart';

class PokemonMapper{
  static fromApi(ApiPokemon apiPokemon){
    if(apiPokemon.hassError) return null;
    return PokemonModel(
      id: apiPokemon.id,
      name: apiPokemon.name,
      image: apiPokemon.image
    );
  }

  static fromLocal(LocalPokemonModel localPokemonModel){
    if (localPokemonModel == null) return null;
    return PokemonModel(
      id: localPokemonModel.id,
      name: localPokemonModel.name,
      image: localPokemonModel.image
    );
  }
}