import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lastsessiondevhub2/screens/pokemon_screen.dart';

import '../blocs/pokemon_cubit.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PokemonCubit>();


    return Scaffold(
      appBar: AppBar(
        title: const Text('Poke App'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(

        builder: (context, state) {
          if (cubit.pokemons.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: cubit.pokemons.length,
            itemBuilder: (context, index) {
             final pokemon = cubit.pokemons[index];
              //pokemos list of poken

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PokemonScreen(pokemon: pokemon),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        pokemon.img?? '',
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                      ),
                    ),
                    Text(pokemon.name ?? ''),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
