import 'package:api_pokemon/data/network.dart';
import 'package:api_pokemon/data/repository/repository.dart';
import 'package:api_pokemon/data/repository/repository_impl.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore());
    Get.put<Repository>(RepositoryImpl());
  }

}