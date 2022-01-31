import 'package:flutter/cupertino.dart';

class Config {
  static const String nullNetworkImage =
      "https://d1csarkz8obe9u.cloudfront.net/"
      "posterpreviews/profile-design-template-4c23db68ba"
      "79c4186fbd258aa06f48b3_screen.jpg?ts=1581063859";

  static const String nullIndexHero = "null_index_hero";
  static const int responseTimeOutInSeconds = 10;

  static const Color primaryColor = Color(0xff7e1416);
  static const Color primaryDarkColor = Color(0xff4d0000);
  static const Color accentColor = Color(0xffF9A61A);

  bool equalsIgnoreCase(String string1, String string2) {
    return string1.toLowerCase() == string2.toLowerCase();
  }
}
