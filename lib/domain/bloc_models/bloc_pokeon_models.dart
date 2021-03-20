import 'package:clean_architecture/domain/model/pokemon_model.dart';

class PokemonModelInitState extends PokemonModel {}
class PokemonModelLoading extends PokemonModel {}

class PokemonModelError extends PokemonModel {
  String error;
  PokemonModelError(this.error);
}

class PokemonModelOk extends PokemonModel {
  PokemonModelOk(PokemonModel model)
      : super(id: model.id, name: model.name, image: model.image);
}
