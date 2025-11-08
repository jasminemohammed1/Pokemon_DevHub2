part of 'pokemon_cubit.dart';

@immutable
sealed class PokemonState {}

final class PokemonInitial extends PokemonState {}
final class PokemonLoading extends PokemonState{}
final class PokemonError extends PokemonState{}
final class PokemonSuccess extends PokemonState{}

//final cubit=context.resd<>().
//context.resd<>().pokens[index].name
//context.read<PokemonCubit>().pokemons.id
//context.read<PokemonCubit>().pokemons.img