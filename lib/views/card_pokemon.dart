import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practicapok/models/list_model.dart';

class CardPokemonView extends StatelessWidget {
  final PokemonModel pok;
  const CardPokemonView({
    Key? key,
    required this.pok
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: new BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Colors.orange.shade100],
                  stops: [0.2, 0.5],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter
                )
              ),
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: [
                    Center(
                      child: Image(
                      // Como queremos traer una imagen desde un url usamos NetworkImage
                      image: NetworkImage(
                          pok.img == null ? 'https://static.vecteezy.com/system/resources/previews/000/566/937/non_2x/vector-person-icon.jpg' : '${pok.img}'),      
                          
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5
                      ),
                      child: Container()
                    )

                  ]
                ),
              ),
              SizedBox(),
              // Usamos Container para el contenedor de la descripción
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(pok.name!, style: TextStyle(fontSize: 40.0, fontFamily: 'Dongle')),
                      
                    ],
                )
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text('Type: '+pok.type!.join(", "), style: TextStyle(fontSize: 20.0, fontFamily: 'Dongle')),
                      MaterialButton(
                        onPressed: (){
                          Navigator.pushNamed(
                            context,
                            '/pokemon',
                            arguments: { 
                              'id'          : pok.id,
                              'num'         : pok.num,
                              'name'        : pok.name,
                              'img'         : pok.img,
                              'type'        : pok.type!.join(", "),
                              'height'      : pok.height,
                              'weight'      : pok.weight,
                              'candy'       : pok.candy,
                              'candy_count' : pok.candyCount,
                              'egg'         : pok.egg,
                              'spawn_chance': pok.spawnChance,
                              'avg_spawns'  : pok.avgSpawns,
                              'weaknesses'  : pok.weaknesses!.join(", ")
                            }
                          );
                        },
                        child: Icon(Icons.chevron_right, color: Colors.blueGrey.shade800, size: 35,),
                      )
                    ],
                )
              ),
            ]
          ),
        )
      )
    );
  }
}