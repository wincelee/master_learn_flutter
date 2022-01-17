import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/classes/user.dart';
import 'package:master_learn/widgets/marquee_widget.dart';

class FutureBuilderListWithoutLoop extends StatefulWidget {
  const FutureBuilderListWithoutLoop({Key? key}) : super(key: key);

  @override
  _FutureBuilderListWithoutLoopState createState() =>
      _FutureBuilderListWithoutLoopState();
}

class _FutureBuilderListWithoutLoopState
    extends State<FutureBuilderListWithoutLoop> {
  Future<List<User>> _fetchUsersWithoutLoop() async {
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
                "[] Future Builder Users Lists Without For Loop With Swipe Down To Refresh"),
          ),
        ),
      ),
      body: SizedBox(
        child: FutureBuilder(
            future: _fetchUsersWithoutLoop(),
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
                        _fetchUsersWithoutLoop();
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
