import 'package:practicapok/models/next_model.dart';
import 'package:practicapok/models/rover_model.dart';


class PokemonModel{
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  String? candyCount;
  String? egg;
  String? spawnChance;
  String? avgSpawns;
  String? spawnTime;
  List<double>? multipliers;
  List<String>? weaknesses;
  List<NextEvolution>? nextEvolution;


  PokemonModel({
      this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.nextEvolution,
  });

  factory PokemonModel.fromMap(Map<String,dynamic> map){
    return PokemonModel(
      id:                 map['id'],
      num:                map['num'] ?? "",
      name:               map['name'] ?? "",
      img:                map['img'],
      type:               map['type']?.cast<String>() ?? "",
      height:             map['height'] ?? "",
      weight:             map['weight'] ?? "",
      candy:              map['candy'] ?? "",
      candyCount:         map['candy_count'].toString() ,
      egg:                map['egg'] ?? "",
      spawnChance:        map['spawn_chance'].toString() ,
      avgSpawns:          map['avg_spawns'].toString(),
      spawnTime:          map['spawn_time'] ?? "",
      weaknesses:         map['weaknesses']?.cast<String>() ?? ""

    );
  }

  factory PokemonModel.fromJson(dynamic json) {
    if (json == null) {
      return PokemonModel();
    }
    return PokemonModel(
      id: json['id'],
      num: json['num'] ?? "",
      name: json['name'] ?? "",
      img: json['img'] ?? "",
      height: json['height'] ?? "",
      weight: json['weight'] ?? "",
      candy: json['candy'] ?? "",
      candyCount: json['candy_count'] ?? "",
      egg: json['egg'] ?? "",
      spawnChance: json['spawn_chance'] ?? "",
      avgSpawns: json['avg_spawns'] ?? "",
      spawnTime: json['spawn_time'] ?? "",
      weaknesses: json['weaknesses'] ?? ""

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candy_count': candyCount,
      'egg': egg,
      'spawn_chance': spawnChance,
      'avg_spawns': avgSpawns,
      'spawn_time': spawnTime,
      'weaknesses' : weaknesses,
      'next_evolution': nextEvolution
    };
  }

  


}