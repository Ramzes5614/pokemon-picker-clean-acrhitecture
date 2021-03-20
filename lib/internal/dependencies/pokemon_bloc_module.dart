import 'package:clean_architecture/data/api/api_util.dart';
import 'package:clean_architecture/data/pokemon_repository_data.dart';
import 'package:clean_architecture/domain/bloc/get_pokeomon_bloc.dart';
import 'package:clean_architecture/internal/dependencies/api_module.dart';
import 'package:clean_architecture/internal/dependencies/local_module.dart';

class PokemonBlocModule{
  static GetPokemonBloc _pokemonBloc;

  static GetPokemonBloc getBloc(){
    if(_pokemonBloc == null){
      _pokemonBloc = GetPokemonBloc(PokemonRepositoryData(
        ApiModule.getApiUtil(), LocalModule.getApiUtil()
      ));
    }
    return _pokemonBloc;
  }
}