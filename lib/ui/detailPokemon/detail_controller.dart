import 'package:api_pokemon/data/model/detail_pokemon_model.dart';
import 'package:api_pokemon/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class DetailController extends GetxController {
  NumberFormat formatter = NumberFormat("#000");
  DetailPokemonModel? detailPokemonModel = DetailPokemonModel();
  List<String> pokemonDescription = [];
  List<Types> types = [];
  Set<String> filter = {};
  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    _getDetailPokemon(int.parse(argumentData['id']));
    _getDescriptionPokemon(int.parse(argumentData['id']));

    update();
  }

  final repository = Get.find<Repository>();

  Future<void> _getDetailPokemon(int id) async {
    try {
      var response = await repository.getDetailPokemon(id);
      detailPokemonModel = response;
      for (var element in (detailPokemonModel?.types as List)) {
        types.add(element);
      }

      print(types[0].type?.name);
      print('detailPokemonModel : $detailPokemonModel');
      update();
    } catch (e) {
      return null;
    }
  }

  Future _getDescriptionPokemon(int id) async {
    try {
      var response = await repository.getDescriptionPokemon(id);

      for (int index = 0; index <= response.flavorTextEntries!.length; index++) {
        if (response.flavorTextEntries?[index].language?.name == 'en') {
          pokemonDescription.add (response.flavorTextEntries?[index].flavorText??'');
        }
      }

      filter = pokemonDescription.toSet();
      pokemonDescription = filter.toList();

      update();
    } catch (e) {
      update();
      return null;
    }
  }
}
