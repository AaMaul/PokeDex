import 'package:api_pokemon/ui/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
        builder: (controller) => Scaffold(
          body: Center(
            child: Lottie.asset("assets/vector/loading_poke.json", width: 100),
          ),
        ));
  }
}
