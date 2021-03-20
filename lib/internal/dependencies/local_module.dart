
import 'package:clean_architecture/data/local/service/local_pokemon_service.dart';

class LocalModule{
  static LocalPokemonSevice _apiUtil;

  static LocalPokemonSevice getApiUtil(){
    if(_apiUtil == null){
      _apiUtil = LocalPokemonSevice();
    }
    return _apiUtil;
  }
}