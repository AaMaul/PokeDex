
import 'package:api_pokemon/data/model/pokemon_model.dart' as pokemon;
import 'package:api_pokemon/data/repository/repository.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  final repository= Get.find<Repository>();

  static const limit = 10;

  final PagingController<int, pokemon.Results> pagingController =
  PagingController(firstPageKey: 0);

  NumberFormat formatter = NumberFormat("#000");


  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int offset) async {
    try {
      final newItems = await repository.getPagedPokemon(offset, limit);
      final isLastPage = newItems!.results!.length < limit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.results!);
      } else {
        final nextPageKey = offset + newItems.results!.length;
        pagingController.appendPage(newItems.results!, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}