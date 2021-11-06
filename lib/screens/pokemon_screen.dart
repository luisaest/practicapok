import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:practicapok/models/list_model.dart';
import 'package:practicapok/network/api_pokemon.dart';

class PokemonScreen extends StatefulWidget {
  PokemonScreen({Key? key,}) : super(key: key);

  @override
  _PokemonScreenState createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  ApiPokemon? apiPokemon;
  //PokemonModel? poke;
  //_PokemonScreenState({this.poke});
  
  @override
  void initState(){
    super.initState();
    apiPokemon = ApiPokemon();
  }

  @override
  Widget build(BuildContext context) {
    final poke = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.orange,
        title: Text('${poke['name']}')
        
      ),
      body: FutureBuilder(
        future: apiPokemon!.getAllPokemon(),
        builder: (BuildContext context, AsyncSnapshot<List<PokemonModel>?> snapshot){
          if(snapshot.hasError){
            return Center(child: Text('Hay un error en la petición'),);
          }else{
            if(snapshot.connectionState == ConnectionState.done){
              print(poke);
              return _detallePokemon(snapshot.data);
            }else{
              return Center(child: CircularProgressIndicator());
            }
          }
        }
      ),
    );
  }

  Widget _detallePokemon(List<PokemonModel>? pokemon){
    final poke = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print(poke);
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 50.0,),
                Text('${poke['name']}', style: TextStyle(fontFamily: 'Dongle', fontSize: 40, fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Height' ,style: TextStyle(fontFamily: 'Dongle', fontSize: 22,)),
                    Chip(
                      backgroundColor: Colors.green,
                      label: Text('${poke['height']}', style: TextStyle(color: Colors.white, fontFamily: 'Dongle', fontSize: 22,),)
                    ),
                    Text('Weight', style: TextStyle(fontFamily: 'Dongle', fontSize: 22,),),
                    Chip(
                      backgroundColor: Colors.green,
                      label: Text('${poke['weight']}', style: TextStyle(color: Colors.white ,fontFamily: 'Dongle', fontSize: 22,),)
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Spawn chance',style: TextStyle(fontFamily: 'Dongle', fontSize: 22,)),
                    Chip(
                      backgroundColor: Colors.grey,
                      label: Text('${poke['spawn_chance']}', style: TextStyle(color: Colors.white, fontFamily: 'Dongle', fontSize: 22,),)
                    ),
                    Text('Avg spawns',style: TextStyle(fontFamily: 'Dongle', fontSize: 22,)),
                    Chip(
                      backgroundColor: Colors.grey,
                      label: Text('${poke['avg_spawns']}', style: TextStyle(color: Colors.white, fontFamily: 'Dongle', fontSize: 22,),)
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Candy',style: TextStyle(fontFamily: 'Dongle', fontSize: 22,)),
                    Chip(
                      backgroundColor: Colors.yellow.shade800,
                      label: Text('${poke['candy']}', style: TextStyle(color: Colors.white, fontFamily: 'Dongle', fontSize: 22,),)
                    ),
                    Text('Candy Count',style: TextStyle(fontFamily: 'Dongle', fontSize: 22,)),
                    Chip(
                      backgroundColor: Colors.yellow.shade800,
                      label: Text('${poke['candy_count']}', style: TextStyle(color: Colors.white, fontFamily: 'Dongle', fontSize: 22,),)
                    ),
                  ],
                ),
                
                Text('Weaknesses',style: TextStyle(fontFamily: 'Dongle', fontSize: 22,)),
                Chip(
                  backgroundColor: Colors.red,
                  label: Text('${poke['weaknesses']}', style: TextStyle(color: Colors.white, fontFamily: 'Dongle', fontSize: 22,),)
                )
        
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: FadeInDown(
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(poke['img'] == null ? 'https://static.vecteezy.com/system/resources/previews/000/566/937/non_2x/vector-person-icon.jpg' : '${poke['img']}'))
                )
              ),
            ),
          ),
      ],
    );
  }
}