import 'dart:async';

import 'package:api_pokemon/data/model/description_model.dart';
import 'package:api_pokemon/data/model/detail_pokemon_model.dart';
import 'package:api_pokemon/data/model/pokemon_model.dart';
import 'package:api_pokemon/data/network.dart';
import 'package:api_pokemon/data/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  FutureOr<PokemonModel?> getPagedPokemon(int offset, int limit) async {
    try {
      var response = await network.dio
          .get("/pokemon", queryParameters: {"offset": offset, "limit": limit});
      return PokemonModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return null;
    }
  }

  @override
  FutureOr<DetailPokemonModel> getDetailPokemon(int id) async {
    try {
      var response = await network.dio.get("/pokemon/$id",);
      return DetailPokemonModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<DescriptionModel> getDescriptionPokemon(int id) async {
    try {
      var response =
          await network.dio.get("/pokemon-species/$id",);
      return DescriptionModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }
}
