import 'package:api_pokemon/data/model/pokemon_model.dart' as pokemon;
import 'package:api_pokemon/ui/detailPokemon/detail_pokemon.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lottie/lottie.dart';

import 'main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (controller) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.purpleAccent,
              title: Row(
                children: [
                  SvgPicture.asset(
                    "assets/vector/ic_pokeball.svg",
                    height: kToolbarHeight - 10,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "PokeDéx",
                      style: GoogleFonts.roboto().copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 32,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Cari Pokemon",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            PagedSliverGrid<int, pokemon.Results?>(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisExtent: 165,
              ),
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<pokemon.Results?>(
                itemBuilder: (context, item, index) => GestureDetector(
                  onTap: (){
                    print('id:${item?.url
                        ?.split("pokemon")
                        .last
                        .replaceAll("/", "")}');
                    Get.to( DetailPokemon(),arguments: {"id":item?.url
                        ?.split("pokemon")
                        .last
                        .replaceAll("/", "")});
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.purpleAccent, width: 2),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 9, top: 5),
                            child: Row(
                              mainAxisAlignment:MainAxisAlignment.end,
                              children: [
                                Text("#${controller.formatter.format(int.parse(item?.url
                                    ?.split("pokemon")
                                    .last
                                    .replaceAll("/", "") ??
                                    "_"),)}"),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${item?.url?.split("pokemon").last.replaceAll("/", "")}.png",
                              placeholder: (context, url) => Lottie.asset(
                                  "assets/vector/loading_poke.json"),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8),
                                  bottomLeft: Radius.circular(8),
                                ),
                                color: Colors.purpleAccent,
                              ),
                              child: Center(
                                child: Text(
                                  item?.name?.capitalizeFirst ?? "_",
                                  style: GoogleFonts.mali().copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // CustomScrollView(
        //   slivers: [
        //     const SliverAppBar(
        //       pinned: true,
        //       snap: false,
        //       floating: false,
        //       backgroundColor: Colors.cyan,
        //       flexibleSpace: FlexibleSpaceBar(
        //         collapseMode: CollapseMode.parallax,
        //         title: Text("Infinite Scroll"),
        //       ),
        //     ),
        //     SliverFillRemaining(
        //       hasScrollBody: true,
        //       child: PagedListView<int, Results>(
        //         padding: EdgeInsets.zero,
        //         pagingController: controller.pagingController,
        //         builderDelegate: PagedChildBuilderDelegate<Results>(
        //           firstPageProgressIndicatorBuilder: (context) =>
        //               const Center(child: CircularProgressIndicator.adaptive()),
        //           newPageProgressIndicatorBuilder: (context) =>
        //               const Center(child: CircularProgressIndicator.adaptive()),
        //           itemBuilder: (context, item, index) => ListTile(
        //             leading: Image.network(
        //                 "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${item.url?.getPokemonId()}.png"),
        //             title: Text(item.name ?? "-"),
        //             subtitle: Text(item.url?.getPokemonId() ?? "-"),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

///Text(item?.url?.split("pokemon").last.replaceAll("/","") ?? "_")
