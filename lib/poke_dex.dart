import 'package:api_pokemon/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PokemonDex extends StatelessWidget {
  const PokemonDex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'API Pokemon Dex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.red,
      ),
      home: const SplashScreen(),
    );
  }
}
