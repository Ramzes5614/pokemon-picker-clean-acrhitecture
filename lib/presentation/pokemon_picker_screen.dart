import 'package:clean_architecture/domain/bloc/get_pokeomon_bloc.dart';
import 'package:clean_architecture/domain/bloc_models/bloc_pokeon_models.dart';
import 'package:clean_architecture/domain/model/pokemon_model.dart';
import 'package:clean_architecture/internal/dependencies/pokemon_bloc_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokemonPickerScreen extends StatefulWidget {
  @override
  _PokemonPickerScreenState createState() => _PokemonPickerScreenState();
}

class _PokemonPickerScreenState extends State<PokemonPickerScreen> {
  int screenIdex = 0;
  TextEditingController _controller = TextEditingController();
  GetPokemonBloc _getPokemonBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPokemonBloc = PokemonBlocModule.getBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PokemonPicker"),
      ),
      body: IndexedStack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text("Первый"),
            ),
          ),
          Container(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(fillColor: Colors.grey),
                            controller: _controller,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15),
                          child: GestureDetector(
                            onTap: () => _getPokemonBloc
                                .loadPokemon(int.parse(_controller.text)),
                            child: Container(
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Center(
                                child: Text("Найти"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 600,
                      child: StreamBuilder(
                        stream: _getPokemonBloc.stream,
                        initialData: _getPokemonBloc.defaultItem,
                        builder: (BuildContext context,
                            AsyncSnapshot<PokemonModel> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data is PokemonModelInitState)
                              return Container();
                            else if (snapshot.data is PokemonModelLoading)
                              return SpinKitDoubleBounce(
                                size: 60,
                                color: Colors.blue,
                              );
                            else if (snapshot.data is PokemonModelOk)
                              return Container(
                                child: Column(
                                  children: [
                                    Text("Имя: ${snapshot.data.name}"),
                                    Text("Id: ${snapshot.data.id}"),
                                    SvgPicture.network(
                                      snapshot.data.image,
                                      height: 400,
                                    )
                                  ],
                                ),
                              );
                            else if (snapshot.data is PokemonModelError)
                              return Text(snapshot.error);
                            return Container();
                          } else {
                            return Container();
                          }
                        },
                      ),
                    )
                  ],
                ),
              )),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: Text("Трейтий"),
            ),
          )
        ],
        index: screenIdex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book,
              ),
              label: "Первый"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Второй"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Третий"),
        ],
        currentIndex: screenIdex,
        onTap: (int i) {
          setState(() {
            screenIdex = i;
          });
        },
      ),
    );
  }
}
