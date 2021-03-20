import 'package:clean_architecture/data/api/api_util.dart';
import 'package:clean_architecture/data/local/service/local_pokemon_service.dart';
import 'package:clean_architecture/data/mapper/to_pokemon_mapper.dart';
import 'package:clean_architecture/domain/model/pokemon_model.dart';
import 'package:clean_architecture/domain/repository/pokemon_repository.dart';

class PokemonRepositoryData extends PokemonRepository {
  final ApiUtil apiUtil;
  final LocalPokemonSevice localPokemonSevice;

  PokemonRepositoryData(this.apiUtil, this.localPokemonSevice);

  @override
  Future<PokemonModel> getPokemon({int id})async{
    dynamic pokemon = await localPokemonSevice.getPokemonByID(id);
    if(pokemon != null) return PokemonMapper.fromLocal(pokemon);
    var pokemonApi = await apiUtil.getPokemon(id);
    if(pokemonApi != null) return PokemonMapper.fromApi(pokemonApi);
    return null;
  }

  @override
  Future<PokemonModel> getPokemonByName({String name}){
    return null;
  }
}