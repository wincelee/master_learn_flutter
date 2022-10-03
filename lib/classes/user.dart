import 'dart:convert';

import 'item.dart';

/*String userToJson(User user) => json.encode(user.toJson());

User userFromJson(String str) => User.fromJson(json.decode(str));*/

class User {
  String? email;
  String? about;
  String? name;
  String? picture;
  int? index;
  String? imageFetchType;

  // User({this.email, this.about, this.name, this.picture, this.index, this.imageFetchType});
  User(this.email, this.about, this.name, this.picture, this.index,
      this.imageFetchType);

  factory User.fromJson(Map<String, dynamic> map) {
    return User(map['email'], map['about'], map['name'], map['picture'],
        map['index'], map['imageFetchType']);
  }
}
