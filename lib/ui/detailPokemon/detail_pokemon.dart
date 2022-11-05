import 'package:api_pokemon/helper/extension_method.dart';
import 'package:api_pokemon/ui/detailPokemon/detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../conts/color.dart';

class DetailPokemon extends StatelessWidget {

  const DetailPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) => Scaffold(
        backgroundColor: controller.types.isNotEmpty
            ? controller.types[0].type?.name?.toPokemonTypeColor()
            : Colors.purpleAccent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            controller.detailPokemonModel?.name?.capitalizeFirst ?? "_",
            style: GoogleFonts.mali().copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Center(
                child: Text(
                  '#${controller.formatter.format(controller.detailPokemonModel?.id ?? 0)}',
                  style: GoogleFonts.mali(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        body:
        controller.pokemonDescription.isNotEmpty &&
                controller.detailPokemonModel != null &&
                controller.types.isNotEmpty
            ?
        Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: SvgPicture.asset(
                      'assets/vector/ic_pokeball.svg',
                      height: 250,
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  Positioned(
                    bottom: Get.size.height * 0.1,
                    right: 0,
                    left: 0,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(20),
                      width: Get.size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.red,
                                  size: 34,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller.types.isNotEmpty
                                ? controller.types
                                    .map((e) => Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 10,
                                            vertical: 3,
                                          ),
                                          decoration: BoxDecoration(
                                            color: e.type?.name
                                                    ?.toPokemonTypeColor() ??
                                                grass,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            e.type?.name ?? '_',
                                            style: GoogleFonts.mali(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ))
                                    .toList()
                                : [],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'About',
                            style: GoogleFonts.mali(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: controller.types[0].type?.name
                                        ?.toPokemonTypeColor() ??
                                    grass),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black87,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: SvgPicture.asset(
                                        "assets/vector/ic_weight.svg",
                                        color: Colors.black87,
                                        width: 20,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '  ${(controller.detailPokemonModel?.weight ?? 0) / 10} Kg',
                                      style: GoogleFonts.mali(fontSize: 14),
                                    ),
                                    TextSpan(
                                      text: '\n\nWeight',
                                      style: GoogleFonts.mali(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                width: 20,
                                thickness: 1,
                                indent: 20,
                                endIndent: 0,
                                color: Colors.black87,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.black87,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: SvgPicture.asset(
                                        "assets/vector/ic_height.svg",
                                        color: Colors.black87,
                                        width: 10,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '  ${(controller.detailPokemonModel?.height ?? 0) / 10} m',
                                      style: GoogleFonts.mali(fontSize: 14),
                                    ),
                                    TextSpan(
                                        text: '\n\nHeight',
                                        style: GoogleFonts.mali(
                                            fontSize: 14))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            '${controller.pokemonDescription[0]?.getPokemonDescription() ?? '_'} ${controller.pokemonDescription[1]?.getPokemonDescription()} ${controller.pokemonDescription[2]?.getPokemonDescription() ?? '_'}',
                            style: GoogleFonts.mali(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            'Base Stats',
                            style: GoogleFonts.mali(
                                fontSize: Get.textScaleFactor * 20,
                                fontWeight: FontWeight.bold,
                                color: controller.types[0].type?.name
                                        ?.toPokemonTypeColor() ??
                                    grass),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Column(
                            children: controller.detailPokemonModel!.stats!.isNotEmpty? controller.detailPokemonModel!.stats!.map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(e.stat?.name?.getPokemonStat() ?? '', style: GoogleFonts.mali(fontSize: 12),),
                                      ],
                                    )),
                                Flexible(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(e.baseStat.toString(), style: GoogleFonts.mali(fontSize: 12,),),
                                      ],
                                    )),
                                Flexible(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: TweenAnimationBuilder<double>(
                                            duration: const Duration(milliseconds: 400),
                                            curve: Curves.easeInOut,
                                            tween: Tween<double>(
                                              begin: 0,
                                              end: (e.baseStat ?? 0) / 255,
                                            ),
                                            builder: (context, value, _) {
                                              return LinearProgressIndicator(
                                                minHeight: 7,
                                                backgroundColor: controller.types[0].type?.name?.toPokemonTypeColor().withOpacity(0.3), color: controller.types[0].type?.name?.toPokemonTypeColor() ?? grass, value: value,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),),
                              ],
                            ),) .toList():[]
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${controller.detailPokemonModel?.id?? 0}.png", width: Get.size.width *0.45,
                            placeholder: (context, url) => Lottie.asset(
                                "assets/vector/loading_poke.json"),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ],
                      ),),
                ],
              )
            : Center(
                child: Lottie.asset('assets/vector/loading_poke.json',width: 50,),
              ),
      ),
    );
  }
}
