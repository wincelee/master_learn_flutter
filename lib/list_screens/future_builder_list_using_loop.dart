import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/classes/user.dart';
import 'package:master_learn/widgets/marquee_widget.dart';

class FutureBuilderListUsingLoop extends StatefulWidget {
  const FutureBuilderListUsingLoop({Key? key}) : super(key: key);

  @override
  _FutureBuilderListUsingLoopState createState() =>
      _FutureBuilderListUsingLoopState();
}

class _FutureBuilderListUsingLoopState
    extends State<FutureBuilderListUsingLoop> {
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
      if (kDebugMode) {
        Logger().wtf("FetchUsersUsingListOfStringObjectHashMapException $e");
      }

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
        Logger().i("FetchUsersUsingListOfStringDynamicHashMapException $e");
      }

      rethrow;
    }
  }

  Future<List<User>> _fetchUsersListUsingLoop() async {
    try {
      // pub spec yaml http:
      // import 'package:http/http.dart' as http;
      final response = await http.get(
          Uri.parse(
              "https://api.json-generator.com/templates/Eh5AlPjYVv6C/data"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          });

      List<User> usersList = [];

      // for json.decode
      // pub spec yaml json_serializable:
      // import 'dart:convert';
      for (var u in json.decode(response.body)) {
        User user = User(u["email"], u["about"], u["name"], u["picture"],
            u["index"], u["imageFetchType"]);

        usersList.add(user);
      }

      // If in debug mode
      // import import 'package:flutter/foundation.dart';
      if (kDebugMode) {
        Logger().i("RunningInDebugMode: True");
      }

      return usersList;
    } catch (e) {
      if (kDebugMode) {
        Logger().wtf("FetchUsersListUsingLoopException $e");
      }

      rethrow;
    }
  }

  void logFetchUsersUsingListOfStringDynamicHashMap() async {
    Logger().i(
        "PrintFetchUsersUsingListOfStringDynamicHashMap ${await _fetchUsersUsingListOfStringDynamicHashMap()}");
  }

  void logFetchUsersUsingListOfStringObjectHashMap() async {
    Logger().i(
        "PrintFetchUsersUsingListOfStringObjectHashMap ${await _fetchUsersUsingListOfStringObjectHashMap()}");
  }

  void logFetchUsersListUsingLoop() async {
    Logger()
        .i("PrintFetchUsersListUsingLoop ${await _fetchUsersListUsingLoop()}");
  }

  @override
  void initState() {
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
        title: const SizedBox(
          child: MarqueeWidget(
            direction: Axis.horizontal,
            child: Text(
                "[] Future Builder Users Lists Using For Loop And Swipe Down To Refresh"),
          ),
        ),
      ),
      body: SizedBox(
        child: FutureBuilder(
            future: _fetchUsersListUsingLoop(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return RefreshIndicator(
                    // background color
                    backgroundColor: Colors.white,
                    // refresh circular progress indicator color
                    color: Colors.green,
                    onRefresh: () async {
                      setState(() {
                        _fetchUsersListUsingLoop();
                      });
                    },
                    child: ListView.builder(
                      itemCount: asyncSnapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (Config().equalsIgnoreCase("imageNetwork",
                            asyncSnapshot.data[index].imageFetchType)) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: CircleAvatar(
                              child: ClipOval(
                                child: Image.network(
                                  asyncSnapshot.data[index].picture,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(asyncSnapshot.data[index].name),
                            subtitle: Text(
                                "${asyncSnapshot.data[index].email} \nUsing Image.network with child"),
                          );
                        } else if (Config().equalsIgnoreCase(
                            "circleAvatarWithRadius",
                            asyncSnapshot.data[index].imageFetchType)) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: CircleAvatar(
                              backgroundColor: Colors.orangeAccent,
                              // radius of the circle image view limit mostly to 30
                              radius: 30.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    asyncSnapshot.data[index].picture),
                                // radius of the image inside the circle
                                radius: 25.0,
                              ),
                            ),
                            title: Text(asyncSnapshot.data[index].name),
                            subtitle: Text(asyncSnapshot.data[index].email),
                          );
                        } else if (Config().equalsIgnoreCase(
                            "circleAvatarInsideCircleAvatar",
                            asyncSnapshot.data[index].imageFetchType)) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: CircleAvatar(
                              // radius of the circle image view limit mostly to 30
                              radius: 30,
                              backgroundColor: Colors.lightGreen,
                              child: CircleAvatar(
                                // radius of the image inside the circle
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    asyncSnapshot.data[index].picture),
                              ),
                            ),
                            title: Text(asyncSnapshot.data[index].name),
                            subtitle: Text(
                                "${asyncSnapshot.data[index].email} \nUsing CircleAvatar inside CircleAvatar"),
                          );
                        }
                        return ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(asyncSnapshot.data[index].picture),
                          ),
                          title: Text(asyncSnapshot.data[index].name),
                          subtitle: Text(
                              "${asyncSnapshot.data[index].email} \nUsing NetworkImage with backgroundImage"),
                        );
                      },
                    ));
              }
            }),
      ),
    );
  }
}
