import 'dart:async';

import 'package:api_pokemon/data/model/description_model.dart';
import 'package:api_pokemon/data/model/pokemon_model.dart';

import '../model/detail_pokemon_model.dart';

abstract class Repository {
  FutureOr<PokemonModel?> getPagedPokemon(int offset, int limit);
  FutureOr<DetailPokemonModel> getDetailPokemon(int id);
  FutureOr<DescriptionModel> getDescriptionPokemon(int id);

}