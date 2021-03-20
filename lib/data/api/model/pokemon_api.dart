class ApiPokemon {
  int id;
  String name;
  String image;
  bool hassError;
  ApiPokemon.fromJson(Map<String, dynamic> map) {
    if(map == null) {
      hassError = true;
      return;
    }else{
      hassError = false;
    }
    id = map['id'];
    name = map['name'];
    image = map['sprites']['other']['dream_world']['front_default'];
  }
}
