
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:practicapok/models/list_model.dart';
import 'package:http/http.dart' as http;

class ApiPokemon{
  //ENDPOINT
  var URL = Uri.parse('https://raw.githubusercontent.com/biuni/pokemongo-pokedex/master/pokedex.json');
  final Dio _dio = Dio();
  //CONSUMIR
  Future<List<PokemonModel>?> getAllPokemon() async{  //puede ser un valor falso
    //definir la ejecucion
    final response = await http.get(URL); //respuesta
    if(response.statusCode == 200){ //se ejecuto correctamente
      var pokemon = jsonDecode(response.body)['pokemon'] as List;
      List<PokemonModel> listPokemon =  pokemon.map((pok) => PokemonModel.fromMap(pok)).toList();  //convertir mapa a objeto
      print(pokemon);
      return listPokemon;
    }else{
      return null;
    }
  }

/*
  Future<PokemonModel> getPokemon() async{  //puede ser un valor falso
    //definir la ejecucion
    final response = await http.get(URL); //respuesta
    if(response.statusCode == 200){ //se ejecuto correctamente
      PokemonModel detalle =
          PokemonModel.fromJson(response.body);

      return detalle;
    }else{
      return ;
    }
  }


*/

  Future<PokemonModel> getPokemon() async {
    try {
      final response = await _dio.get(
          'https://raw.githubusercontent.com/biuni/pokemongo-pokedex/master/pokedex.json');
      PokemonModel detalle =
          PokemonModel.fromJson(response.data);
      
      

      return detalle;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
/*
  Future<List<Cast>> getCast(int id) async {
    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/movie/$id/credits?api_key=eb5875f8c00b9aabd203e075a0e4b25f&language=en-MX&page=1');
      var list = response.data['cast'] as List;
      List<Cast> castList = list
          .map((c) => Cast(
              name: c['name'],
              profilePath: c['profile_path']))
          .toList();

      return castList;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }

  Future<String> getYoutubeId(int id) async {
    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/movie/${id}/videos?api_key=eb5875f8c00b9aabd203e075a0e4b25f&language=en-MX&page=1');
      var youtubeId = response.data['results'][0]['key'];
      return youtubeId;
    } catch (error, stacktrace) {
      throw Exception(
          'Exception accoured: $error with stacktrace: $stacktrace');
    }
  }
  */
}