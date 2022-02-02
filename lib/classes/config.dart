import 'package:flutter/material.dart';

class Config {
  static const String nullNetworkImage =
      "https://d1csarkz8obe9u.cloudfront.net/"
      "posterpreviews/profile-design-template-4c23db68ba"
      "79c4186fbd258aa06f48b3_screen.jpg?ts=1581063859";

  static const String nullIndexHero = "null_index_hero";
  static const int responseTimeOutInSeconds = 20;

  static const Color primaryColor = Color(0xff7e1416);
  static const Color primaryDarkColor = Color(0xff4d0000);
  static const Color accentColor = Color(0xffF9A61A);

  static MaterialColor createMaterialColor(Color color) {
    List colorLevels = <double>[.05];
    final colorSwatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      colorLevels.add(0.1 * i);
    }
    for (var colorLevel in colorLevels) {
      final double ds = 0.5 - colorLevel;
      colorSwatch[(colorLevel * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, colorSwatch);
  }

  MaterialColor createMaterialColorManually = const MaterialColor(
    0xff7e1416,
    <int, Color>{
      50: Color(0x0d7e1416),
      100: Color(0x1a7e1416),
      200: Color(0x337e1416),
      300: Color(0x4d7e1416),
      400: Color(0x667e1416),
      500: Color(0x807e1416),
      600: Color(0x997e1416),
      700: Color(0xB37e1416),
      800: Color(0xCC7e1416),
      900: Color(0xE67e1416),
    },
  );

  bool equalsIgnoreCase(String string1, String string2) {
    return string1.toLowerCase() == string2.toLowerCase();
  }
}
