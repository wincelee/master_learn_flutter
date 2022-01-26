import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:master_learn/classes/user.dart';

class AsyncFutures{

  static Future<List<HashMap<String, dynamic>>>
  fetchListsOfStringDynamicHashMap() async {
    try {
      final response = await http.get(
          Uri.parse("https://api.json-generator.com/templates/Eh5AlPjYVv6C/data"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          });

      final List<HashMap<String, dynamic>> responseList;

      if (response.statusCode == 200) {
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
      if (kDebugMode) {
        Logger().wtf("FetchUsersUsingListOfStringObjectHashMapException $e");
      }

      rethrow;
    }
  }

  static Future<List<User>> fetchUsersListWithoutLoop() async {
    try {
      // pub spec yaml http:
      // import 'package:http/http.dart' as http;
      final response = await http.get(
          Uri.parse("https://api.json-generator.com/templates/Eh5AlPjYVv6C/data"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          });

      final List<User> usersList;

      if (response.statusCode == 200) {
        usersList = json
            .decode(response.body)
        // In event of failure return line below
        //.cast<Map<String, dynamic>>()
            .map<User>((json) => User.fromJson(json))
            .toList();
      } else if (response.statusCode == 401) {
        usersList = [];
      } else {
        usersList = [];
      }
      return usersList;
    } catch (e) {
      if (kDebugMode) {
        Logger().wtf("FetchUsersWithoutLoopException $e");
      }

      rethrow;
    }
  }

}