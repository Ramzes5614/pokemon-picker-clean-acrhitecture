import 'dart:async';
import 'package:clean_architecture/domain/bloc_models/bloc_pokeon_models.dart';
import 'package:clean_architecture/domain/model/pokemon_model.dart';
import 'package:clean_architecture/domain/repository/pokemon_repository.dart';

class GetPokemonBloc{
  StreamController<PokemonModel> _controller = StreamController<PokemonModel>.broadcast();
  PokemonRepository pokemonRepository;
  GetPokemonBloc(this.pokemonRepository);


  Stream<PokemonModel> get stream => _controller.stream;
  PokemonModel get defaultItem => PokemonModelInitState();

  void pickItem(PokemonModel model){
    _controller.sink.add(model);
  }

  void loadPokemon(int id)async{
    _controller.sink.add(PokemonModelLoading());
    var pokemon = await pokemonRepository.getPokemon(id: id);
    if(pokemon != null){
      _controller.sink.add(PokemonModelOk(pokemon));
    }else{
      _controller.sink.add(PokemonModelError("Ошибка"));
    }
  }

  close(){
    _controller.close();
  }
}