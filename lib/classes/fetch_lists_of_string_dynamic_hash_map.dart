import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

Future<List<HashMap<String, dynamic>>>
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
