import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';

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

  static String numberFormatter(double number) {
    // dependencies:
    //   intl:
    //  import 'package:intl/intl.dart';

    return NumberFormat('#,###.##').format(number);
  }

  static Future<ui.Image> getUiImage(
      String imageAssetPath, int height, int width) async {
    final ByteData assetImageByteData = await rootBundle.load(imageAssetPath);
    final codec = await ui.instantiateImageCodec(
      assetImageByteData.buffer.asUint8List(),
      targetHeight: height,
      targetWidth: width,
    );
    final image = (await codec.getNextFrame()).image;

    return image;
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

  static SnackBar buildSnackBar(
          String content,
          double elevation,
          EdgeInsetsGeometry marginEdgeInsetsGeometry,
          EdgeInsetsGeometry paddingEdgeInsetsGeometry,
          Color backgroundColor,
          Duration duration) =>
      SnackBar(
        content: Text(content),
        elevation: elevation,
        margin: marginEdgeInsetsGeometry,
        padding: paddingEdgeInsetsGeometry,
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        duration: duration,
      );

  static void loaderDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: iconProgressIndicator(),
          );
        });
  }

  void hideKeyboard() {
    FocusManager
        .instance
        .primaryFocus
        ?.unfocus();
  }

  static List<Map<String, String>> itemsList = [
    {
      "name":"Laptop Apple MacBook Air With M1 Chip",
      "imageUrl":"https://ke.jumia.is/unsafe/fit-in/300x300/filters:fill(white)/product/32/999425/1.jpg?8801"
    },
    {
      "name":"Generic 7-inch Touch Control Laptop Q",
      "imageUrl":"https://ke.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/11/356195/1.jpg?5748"
    },
    {
      "name":"Generic Notebook Computer",
      "imageUrl":"https://ke.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/41/836195/1.jpg?4367"
    },
    {
      "name":"Generic Laptop Sleeve Case",
      "imageUrl":"https://ke.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/07/735195/1.jpg?8604"
    },
    {
      "name":"Generic Ly Voltage Transformer",
      "imageUrl":"https://ke.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/58/288692/1.jpg?0791"
    },
    {
      "name":"117 In 1 Magnetic Screwdriver Set",
      "imageUrl":"https://ke.jumia.is/unsafe/fit-in/500x500/filters:fill(white)/product/70/834354/1.jpg?4502"
    },
  ];

}
