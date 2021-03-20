import 'dart:io';
import 'package:clean_architecture/data/local/model/local_pokemon_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

import 'presentation/pokemon_picker_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///total hive types number = 1
  ///to build models type in console
  ///flutter packages pub run build_runner build --delete-conflicting-outputs
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(PokemonModelAdapter());
  Hive.openBox('pokemons');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PokemonPickerScreen(),
    );
  }
}
