import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:lastsessiondevhub2/models/pokemon.dart';
import 'package:lastsessiondevhub2/services/dio_helper.dart';
import 'package:meta/meta.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  PokemonClub ?pokemonclub;
  List<Pokemon> pokemons=[];
  //pokemons[0]
  //pokemons[1]
  void getAllPokemons(){
    emit(PokemonLoading());
    DioHelper.getData().then((value){
      final jsondate=jsonDecode(value.data);
      pokemonclub=PokemonClub.fromJson(jsondate);
      pokemons=List<Pokemon>.from(pokemonclub!.pokemon);
      emit(PokemonSuccess());





    }).catchError((error){
      print("$error");
      emit(PokemonError());
    });


  }



}
