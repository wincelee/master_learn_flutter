import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:master_learn/classes/user.dart';

class FutureBuilderList extends StatefulWidget {
  const FutureBuilderList({Key? key}) : super(key: key);

  @override
  _FutureBuilderListState createState() => _FutureBuilderListState();
}

class _FutureBuilderListState extends State<FutureBuilderList> {
  Future<List<HashMap<String, Object>>>
      _fetchUsersUsingListOfStringObjectHashMap() async {
    try {
      final response = await http.get(
        Uri.parse("https://api.json-generator.com/templates/Eh5AlPjYVv6C/data"),
        /*headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          }*/
      );

      log("ResponseStatusCode ${response.statusCode}");

      final List<HashMap<String, Object>> responseList;

      if (response.statusCode == 200) {
        responseList = json
            .decode(response.body)
            .map<HashMap<String, Object>>(
                (e) => HashMap<String, Object>.from(e))
            .toList();
      } else if (response.statusCode == 401) {
        Map<String, Object> responseMap = {'response': response.toString()};

        responseList = [];
      } else {
        responseList = [];
      }

      return responseList;
    } catch (e) {
      Logger().w("FetchUsersUsingListOfStringObjectHashMapException $e");

      rethrow;
    }
  }

  Future<List<HashMap<String, dynamic>>>
      _fetchUsersUsingListOfStringDynamicHashMap() async {
    try {
      final response = await http.get(
          Uri.parse(
              "https://api.json-generator.com/templates/Eh5AlPjYVv6C/data"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          });

      log("ResponseStatusCode ${response.statusCode}");

      final List<HashMap<String, dynamic>> responseList;

      if (response.statusCode == 200) {
        // responseList = json.decode(response.body);

        //HashMap<String, dynamic> data = HashMap<String, dynamic>.from(json.decode(response.body));

        //responseList = List<HashMap<String, dynamic>>.from(json.decode(response.body));

        // responseList = decodedJson.map<HashMap<String, dynamic>>((e) => HashMap<String, dynamic>.from(e))
        //     .toList();

        responseList = json
            .decode(response.body)
            .map<HashMap<String, dynamic>>(
                (e) => HashMap<String, dynamic>.from(e))
            .toList();
      } else if (response.statusCode == 401) {
        responseList = [];
      } else {
        responseList = [];
      }

      return responseList;
    } catch (e) {
      log("FetchUsersUsingListOfStringDynamicHashMapException $e");

      rethrow;
    }
  }

  Future<List<HashMap<String, dynamic>>> _fetchUsersListHashMap() async {
    try {
      final response =
          await http.get(Uri.parse("https://jsonkeeper.com/b/XBCA"));
      // final response = await http.get(Uri.parse(/*"https://jsonkeeper.com/b/XBCA"*/
      //     "https://api.json-generator.com/templates/Eh5AlPjYVv6C/data"),
      // headers: {
      //   "Content-Type": "application/json",
      //   "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
      // });

      late List<HashMap<String, dynamic>> responseList;

      if (response.statusCode == 200) {
        // responseList = json.decode(response.body);

        //HashMap<String, dynamic> data = HashMap<String, dynamic>.from(json.decode(response.body));

        responseList =
            List<HashMap<String, dynamic>>.from(json.decode(response.body));
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

  Future<List<User>> _fetchUsersListUsingLoop() async {
    try {
      // pub spec yaml http:
      // import 'package:http/http.dart' as http;
      var response = await http.get(Uri.parse("https://jsonkeeper.com/b/XBCA"));

      // for json.decode
      // pub spec yaml json_serializable:
      // import 'dart:convert';
      var jsonResponse = json.decode(response.body);

      List<User> usersList = [];

      for (var u in jsonResponse) {
        User user =
            User(u["email"], u["about"], u["name"], u["picture"], u["index"]);

        usersList.add(user);
      }

      return usersList;
    } catch (e) {
      log("FetchUsersListUsingLoopException $e");

      rethrow;
    }
  }

  /*Future<List<User>> _fetchUsersWithoutLoop() async {
    try {
      // pub spec yaml http:
      // import 'package:http/http.dart' as http;
      var data = await http.get(Uri.parse("https://jsonkeeper.com/b/XBCA"));

      late final List<User> usersList = User.fromJson(json.decode(data.body)) as List<User>;

      return usersList;

    } catch (exception) {
      log("FetchUsersListException $exception");

      rethrow;
    }
  }
*/
  void logFetchUsersUsingListOfStringDynamicHashMap() async {
    Logger().i(
        "PrintFetchUsersUsingListOfStringDynamicHashMap ${await _fetchUsersUsingListOfStringDynamicHashMap()}");
  }

  void logFetchUsersUsingListOfStringObjectHashMap() async {
    Logger().i(
        "PrintFetchUsersUsingListOfStringObjectHashMap ${await _fetchUsersUsingListOfStringObjectHashMap()}");
  }

  void logFetchUsersListUsingLoop() async {
    log("PrintFetchUsersListUsingLoop ${await _fetchUsersListUsingLoop()}");

    // Logger().i(
    //     "PrintFetchUsersListUsingLoop ${await _fetchUsersListUsingLoop()}");
  }

  @override
  void initState() {
    //log("FetchedUsersList $_fetchUsersList()");
    //log("FetchedUsersHashMap $_fetchUsersListHashMap()");

    // logFetchUsersUsingListOfStringDynamicHashMap();
    // logFetchUsersUsingListOfStringObjectHashMap();
    logFetchUsersListUsingLoop();

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
      body: SizedBox(
        child: FutureBuilder(
            future: _fetchUsersListUsingLoop(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.data == null) {
                return const SizedBox(
                  child: Center(child: Text('Loading...')),
                );
              } else {
                return ListView.builder(
                  itemCount: asyncSnapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(asyncSnapshot.data[index].toString()));
                  },
                );
              }
            }),
      ),
    );
  }
}