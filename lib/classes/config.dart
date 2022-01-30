class Config {
  static const String nullNetworkImage =
      "https://d1csarkz8obe9u.cloudfront.net/"
      "posterpreviews/profile-design-template-4c23db68ba"
      "79c4186fbd258aa06f48b3_screen.jpg?ts=1581063859";

  static const String nullIndexHero = "null_index_hero";
  static const int responseTimeOutInSeconds = 10;

  bool equalsIgnoreCase(String string1, String string2) {
    return string1.toLowerCase() == string2.toLowerCase();
  }
}
