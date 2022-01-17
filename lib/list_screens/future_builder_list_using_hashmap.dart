import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/widgets/marquee_widget.dart';

class FutureBuilderListUsingHashMap extends StatefulWidget {
  const FutureBuilderListUsingHashMap({Key? key}) : super(key: key);

  @override
  _FutureBuilderListUsingHashMapState createState() =>
      _FutureBuilderListUsingHashMapState();
}

class _FutureBuilderListUsingHashMapState
    extends State<FutureBuilderListUsingHashMap> {
  Future<List<HashMap<String, dynamic>>>
      _fetchUsersUsingListOfStringObjectHashMap() async {
    try {
      final response = await http.get(
          Uri.parse(
              "https://api.json-generator.com/templates/Eh5AlPjYVv6C/data"),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer tltsp6dmnbif01jy9xfo9ssn4620u89xhuwcm5t3",
          });

      Logger().i("ResponseStatusCode ${response.statusCode}");
      Logger().i("ResponseBody ${response.body}");

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

  @override
  void initState() {

    _fetchUsersUsingListOfStringObjectHashMap();

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
                "[] Future Builder Users Lists Using HashMap With Swipe Down To Refresh"),
          ),
        ),
      ),
      body: SizedBox(
        child: FutureBuilder(
            future: _fetchUsersUsingListOfStringObjectHashMap(),
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
                        _fetchUsersUsingListOfStringObjectHashMap();
                      });
                    },
                    child: ListView.builder(
                      itemCount: asyncSnapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (Config().equalsIgnoreCase("imageNetwork",
                            asyncSnapshot.data[index].imageFetchType?? '')) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: CircleAvatar(
                              child: ClipOval(
                                child: Image.network(
                                  asyncSnapshot.data[index].picture?? Config.nullNetworkImage,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            title: Text(asyncSnapshot.data[index].name?? ''),
                            subtitle: Text(
                                "${asyncSnapshot.data[index].email?? ''} \nUsing Image.network with child"),
                          );
                        } else if (Config().equalsIgnoreCase(
                            "circleAvatarWithRadius",
                            asyncSnapshot.data[index].imageFetchType?? '')) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: CircleAvatar(
                              backgroundColor: Colors.orangeAccent,
                              // radius of the circle image view limit mostly to 30
                              radius: 30.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    asyncSnapshot.data[index].picture ?? Config.nullNetworkImage),
                                // radius of the image inside the circle
                                radius: 25.0,
                              ),
                            ),
                            title: Text(asyncSnapshot.data[index].name ?? ''),
                            subtitle: Text(asyncSnapshot.data[index].email?? ''),
                          );
                        } else if (Config().equalsIgnoreCase(
                            "circleAvatarInsideCircleAvatar",
                            asyncSnapshot.data[index].imageFetchType?? '')) {
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
                                    asyncSnapshot.data[index].picture?? Config.nullNetworkImage),
                              ),
                            ),
                            title: Text(asyncSnapshot.data[index].name ?? ''),
                            subtitle: Text(
                                "${asyncSnapshot.data[index].email ?? ''} \nUsing CircleAvatar inside CircleAvatar"),
                          );
                        }
                        return ListTile(
                          contentPadding: const EdgeInsets.all(10),
                          leading: CircleAvatar(
                            backgroundImage:
                            NetworkImage(asyncSnapshot.data[index].picture?? Config.nullNetworkImage),
                          ),
                          title: Text(asyncSnapshot.data[index].name ?? ''),
                          subtitle: Text(
                              "${asyncSnapshot.data[index].email ?? ''} \nUsing NetworkImage with backgroundImage"),
                        );
                      },
                    ));
              }
            }),
      ),
    );
  }
}
