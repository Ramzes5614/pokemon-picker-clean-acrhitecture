import 'package:clean_architecture/data/local/model/local_pokemon_model.dart';
import 'package:hive/hive.dart';

class LocalPokemonSevice {
  static const _BOX_NAME = 'pokemons';

  Box _box;
  LocalPokemonSevice() {
    openBox();
  }

  openBox() async {
    _box = await Hive.openBox(_BOX_NAME);
  }

  Future<LocalPokemonModel> getPokemonByID(int id) async {
    if (!_box.isOpen) {
      _box = await Hive.openBox(_BOX_NAME);
    }
    var pokemonModel = _box.get(id, defaultValue: null);
    return pokemonModel;
  }
}
