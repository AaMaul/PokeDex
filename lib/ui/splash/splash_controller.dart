import 'dart:async';

import 'package:api_pokemon/ui/main/main_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(
        const Duration(seconds: 3), () => Get.offAll(() => const MainScreen()));
    super.onInit();
  }
}
