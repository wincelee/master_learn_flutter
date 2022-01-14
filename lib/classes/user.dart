
import 'dart:convert';

/*String userToJson(User user) => json.encode(user.toJson());

User userFromJson(String str) => User.fromJson(json.decode(str));*/


class User {
  String? email;
  String? about;
  String? name;
  String? picture;
  int? index;

  // User({this.email, this.about, this.name, this.picture, this.index});
  User(this.email, this.about, this.name, this.picture, this.index);


  /*factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    about: json["about"],
    name: json["name"],
    picture: json["picture"],
    index: json["index"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "about": about,
    "name": name,
    "picture": picture,
    "index": index
  };*/
}
