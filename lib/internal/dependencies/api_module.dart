
import 'package:clean_architecture/data/api/api_util.dart';
import 'package:clean_architecture/data/api/service/pokemon_service.dart';

class ApiModule{
  static ApiUtil _apiUtil;

  static ApiUtil getApiUtil(){
    if(_apiUtil == null){
      _apiUtil = ApiUtil(PokemonService());
    }
    return _apiUtil;
  }
}