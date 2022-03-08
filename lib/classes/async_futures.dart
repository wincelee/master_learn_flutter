import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/classes/item.dart';
import 'package:master_learn/classes/item2.dart';
import 'package:master_learn/classes/user.dart';

import '../widgets/icon_progress_indicator.dart';

class AsyncFutures {
  static int? statusCode;

  static Future<List<HashMap<String, dynamic>>>
      fetchListsOfStringDynamicHashMap() async {
    try {
      final response = await http.get(
          Uri.parse(
              "https://api.json-generator.com/templates/Eh5AlPjYVv6C/data"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          }).timeout(const Duration(seconds: Config.responseTimeOutInSeconds));

      statusCode = response.statusCode;

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
        Logger().wtf(
            "FetchUsersUsingListOfStringObjectHashMapException $e \n\nResponseStatusCode ${statusCode!}");
      }

      rethrow;
    }
  }

  static Future<List<User>> fetchUsersListWithoutLoop() async {
    try {
      // pub spec yaml http:
      // import 'package:http/http.dart' as http;
      final response = await http.get(
          Uri.parse(
              "https://api.json-generator.com/templates/Eh5AlPjYVv6C/data"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          }) /*.timeout(const Duration(seconds: Config.responseTimeOutInSeconds))*/;

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
        Logger().wtf(
            "FetchUsersWithoutLoopException $e \n\nResponseStatusCode ${statusCode!}");
      }

      rethrow;
    }
  }

  static Future<List<Item>> fetchItems(String url) async {
    try {
      // pub spec yaml http:
      // import 'package:http/http.dart' as http;
      final response = await http.get(
          Uri.parse(
              url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          }) /*.timeout(const Duration(seconds: Config.responseTimeOutInSeconds))*/;

      final List<Item> itemsList;

      if (response.statusCode == 200) {
        itemsList = json
            .decode(response.body)
        // In event of failure return line below
        //.cast<Map<String, dynamic>>()
            .map<Item>((json) => Item.fromJson(json))
            .toList();
      } else if (response.statusCode == 401) {
        itemsList = [];
      } else {
        itemsList = [];
      }
      return itemsList;
    } catch (e) {
      if (kDebugMode) {
        Logger().wtf(
            "FetchItemsException $e \n\nResponseStatusCode ${statusCode!}");
      }

      rethrow;
    }
  }

  static Future<List<Item2>> fetchItems2(String query) async {
    try {
      final response = await http.get(
          Uri.parse(
              "https://api.json-generator.com/templates/ueOoUwh5r44G/data"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          }) /*.timeout(const Duration(seconds: Config.responseTimeOutInSeconds))*/;

      final List<Item2> itemsList;

      if (response.statusCode == 200) {
        itemsList = json
            .decode(response.body)
            .map<Item2>((json) => Item2.fromJson(json))
            .where((item) {
          final idLower = item.id.toLowerCase();
          final titleLower = item.title.toLowerCase();
          final subTitleLower = item.subTitle.toLowerCase();
          final searchLower = query.toLowerCase();

          return idLower.contains(searchLower) ||
              titleLower.contains(searchLower) ||
              subTitleLower.contains(searchLower);
        }).toList();
      } else if (response.statusCode == 401) {
        itemsList = [];
      } else {
        itemsList = [];
      }
      return itemsList;
    } catch (e) {
      if (kDebugMode) {
        Logger().wtf(
            "FetchItemsException $e \n\nResponseStatusCode ${statusCode!}");
      }

      rethrow;
    }
  }

  static Future<List<HashMap<String, dynamic>>> fetchLists(
      String url, String query) async {
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
      }).timeout(const Duration(seconds: Config.responseTimeOutInSeconds));

      statusCode = response.statusCode;

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
        Logger().wtf(
            "FetchUsersUsingListOfStringObjectHashMapException $e \n\nResponseStatusCode ${statusCode!}");
      }

      rethrow;
    }
  }


  static Future<List<HashMap<String, dynamic>>> fetchListOfMaps(
      String url) async {
    try {
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
      }).timeout(const Duration(seconds: Config.responseTimeOutInSeconds));

      statusCode = response.statusCode;

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
        Logger().wtf(
            "FetchListOfMapsException $e \n\nResponseStatusCode ${statusCode!}");
      }

      rethrow;
    }
  }
}
