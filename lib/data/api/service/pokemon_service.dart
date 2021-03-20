import 'package:clean_architecture/data/api/model/pokemon_api.dart';
import 'package:dio/dio.dart';

class PokemonService {
  static const _BASE_URL = 'https://pokeapi.co';
  static const _ENDPOINT = '/api/v2/pokemon/';

  final Dio _dio = Dio(BaseOptions(baseUrl: _BASE_URL));

  Future<ApiPokemon> getPokemonByID(int id) async {
    try {
      final response = await _dio.get(_ENDPOINT+'$id');
      if(response.statusCode == 200){
        return ApiPokemon.fromJson(response.data);
      }
      else return ApiPokemon.fromJson(null);
    } catch (error) {
      print("Ошибка $error");
      return ApiPokemon.fromJson(null);
    }
  }
}
