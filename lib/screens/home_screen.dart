import 'package:flutter/material.dart';
import 'package:practicapok/models/list_model.dart';
import 'package:practicapok/network/api_pokemon.dart';
import 'package:practicapok/screens/pokemon_screen.dart';
import 'package:practicapok/views/card_pokemon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiPokemon? apiPokemon;

  @override
  void initState(){
    super.initState();
    apiPokemon = ApiPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiPokemon!.getAllPokemon(),
        builder: (BuildContext context, AsyncSnapshot<List<PokemonModel>?> snapshot){
          if(snapshot.hasError){
            return Center(child: Text('Hay un error en la petición'),);
          }else{
            if(snapshot.connectionState == ConnectionState.done){
              return _listPokemons(snapshot.data);
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
        }
      ),
    );
  }

  Widget _listPokemons(List<PokemonModel>?pokemon){
    return ListView.separated(
      itemBuilder: (BuildContext context, index){
        PokemonModel pok = pokemon![index];
        //return Card();
        return CardPokemonView(pok: pok);
      }, 
      separatorBuilder: (_, __) => Divider(height: 10,), 
      itemCount: pokemon!.length
    );
  }




}