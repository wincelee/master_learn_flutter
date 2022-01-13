import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:master_learn/classes/user.dart';

class FutureBuilderList extends StatefulWidget {
  const FutureBuilderList({Key? key}) : super(key: key);

  @override
  _FutureBuilderListState createState() => _FutureBuilderListState();
}

class _FutureBuilderListState extends State<FutureBuilderList> {
  Future<List<HashMap<String, Object>>> _fetchUsersListHashMap() async {
    try {
      //final response = await http.get(Uri.parse("https://jsonkeeper.com/b/XBCA"));
      final response = await http.get(Uri.parse(/*"https://jsonkeeper.com/b/XBCA"*/
          "https://api.json-generator.com/templates/xYnWiKwNh-ye/data"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
      });

      print(response);

      late List<HashMap<String, Object>> responseList;

      if (response.statusCode == 200) {
        responseList = json.decode(response.body);
      }

      // If in debug mode
      // import import 'package:flutter/foundation.dart';
      if (kDebugMode) {
        log("RunningInDebugMode: True");
      }

      String stringList = jsonEncode(responseList);

      log("FetchUsersListHashMap $stringList");

      return responseList;

    } catch (e) {

      log("FetchUsersListHashMapException $e");

      rethrow;
    }
  }

  Future<List<User>> _fetchUsersList() async {
    try {
      // pub spec yaml http:
      // import 'package:http/http.dart' as http;
      var data = await http.get(Uri.parse("https://jsonkeeper.com/b/XBCA"));

      // pub spec yaml json_serializable:
      // import 'dart:convert';
      var jsonData = json.decode(data.body);

      List<User> usersList = [];

      for (var i in jsonData) {
        User user =
            User(i["email"], i["about"], i["name"], i["picture"], i["index"]);

        usersList.add(user);
      }

      return usersList;
    } catch (exception) {
      log("FetchUsersListException $exception");

      rethrow;
    }
  }

  @override
  void initState() {
    //log("FetchedUsersList $_fetchUsersList()");
    //log("FetchedUsersHashMap $_fetchUsersListHashMap()");

    _fetchUsersListHashMap();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text("Future Builder Users Array Lists"),
      ),
    );
  }
}
