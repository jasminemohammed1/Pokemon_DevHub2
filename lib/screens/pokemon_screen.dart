import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/pokemon_cubit.dart';

class PokemonScreen extends StatelessWidget {
  final Pokemon pokemon;


  const PokemonScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PokemonCubit>(); // access cubit if needed

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name ?? 'Unknown'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.network(
              pokemon.img ?? '',
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
            ),
          ),
          Text('Height: ${pokemon.height ?? 'N/A'}'),
          Text('Weight: ${pokemon.weight ?? 'N/A'}'),
          Wrap(
            children: (pokemon.type ?? [])
                .map((e) => Padding(
              padding: const EdgeInsets.all(4),
              child: Text(e),
            ))
                .toList(),
          ),
          Wrap(
            children: (pokemon.weaknesses ?? [])
                .map((e) => Padding(
              padding: const EdgeInsets.all(4),
              child: Text(e),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
