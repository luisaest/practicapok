import 'package:flutter/material.dart';
import 'package:practicapok/screens/home_screen.dart';
import 'package:practicapok/screens/pokemon_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/pokemon' : (BuildContext context) => PokemonScreen(),
      },
      debugShowCheckedModeBanner: false,
      //home: LoginScreen(),
      home: HomeScreen(),
    );
  }
}