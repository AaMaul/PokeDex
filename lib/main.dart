import 'package:api_pokemon/binding/global_bindings.dart';
import 'package:api_pokemon/poke_dex.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalBindings().dependencies();
  runApp(const PokemonDex());
}
