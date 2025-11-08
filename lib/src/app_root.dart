import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastsessiondevhub2/blocs/pokemon_cubit.dart';
import 'package:lastsessiondevhub2/screens/pockemons_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonCubit>(
          create: (context) => PokemonCubit()..getAllPokemons(),

        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:false ,
        home: PokemonsScreen(),
      ),
    );
  }
}
