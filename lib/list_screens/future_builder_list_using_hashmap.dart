import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/classes/future_fetch_lists.dart';
import 'package:master_learn/list_screens/user_details.dart';
import 'package:master_learn/widgets/marquee_widget.dart';

class FutureBuilderListUsingHashMap extends StatefulWidget {
  const FutureBuilderListUsingHashMap({Key? key}) : super(key: key);

  @override
  _FutureBuilderListUsingHashMapState createState() =>
      _FutureBuilderListUsingHashMapState();
}

class _FutureBuilderListUsingHashMapState
    extends State<FutureBuilderListUsingHashMap> {

  @override
  void initState() {
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
            future: fetchUsersUsingListOfStringDynamicHashMap(),
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
                        fetchUsersUsingListOfStringDynamicHashMap();
                      });
                    },
                    child: ListView.builder(
                      itemCount: asyncSnapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (Config().equalsIgnoreCase(
                            "imageNetwork",
                            asyncSnapshot.data[index]["imageFetchType"] ??
                                '')) {
                          return ListTile(
                              contentPadding: const EdgeInsets.all(10),
                              leading: CircleAvatar(
                                child: ClipOval(
                                  child: Image.network(
                                      asyncSnapshot.data[index]["picture"] ??
                                          Config.nullNetworkImage,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              title:
                                  Text(asyncSnapshot.data[index]["name"] ?? ''),
                              subtitle: Text(
                                  "${asyncSnapshot.data[index]["email"] ?? ''} \nUsing Image.network with child"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserDetails(
                                              email: asyncSnapshot.data[index]
                                                      ["email"] ??
                                                  '',
                                              about: asyncSnapshot.data[index]
                                                      ["about"] ??
                                                  '',
                                              name: asyncSnapshot.data[index]
                                                      ["name"] ??
                                                  '',
                                              picture: asyncSnapshot.data[index]
                                                      ["picture"] ??
                                                  Config.nullNetworkImage,
                                              imageFetchType:
                                                  asyncSnapshot.data[index]
                                                          ["imageFetchType"] ??
                                                      '',
                                            )));
                              });
                        } else if (Config().equalsIgnoreCase(
                            "circleAvatarWithRadius",
                            asyncSnapshot.data[index]["imageFetchType"] ??
                                '')) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: CircleAvatar(
                              backgroundColor: Colors.orangeAccent,
                              // radius of the circle image view limit mostly to 30
                              radius: 30.0,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    asyncSnapshot.data[index]["picture"] ??
                                        Config.nullNetworkImage),
                                // radius of the image inside the circle
                                radius: 25.0,
                              ),
                            ),
                            title:
                                Text(asyncSnapshot.data[index]["name"] ?? ''),
                            subtitle:
                                Text(asyncSnapshot.data[index]["email"] ?? ''),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDetails(
                                            email: asyncSnapshot.data[index]
                                                    ["email"] ??
                                                '',
                                            about: asyncSnapshot.data[index]
                                                    ["about"] ??
                                                '',
                                            name: asyncSnapshot.data[index]
                                                    ["name"] ??
                                                '',
                                            picture: asyncSnapshot.data[index]
                                                    ["picture"] ??
                                                Config.nullNetworkImage,
                                            imageFetchType:
                                                asyncSnapshot.data[index]
                                                        ["imageFetchType"] ??
                                                    '',
                                          )));
                            },
                          );
                        } else if (Config().equalsIgnoreCase(
                            "circleAvatarInsideCircleAvatar",
                            asyncSnapshot.data[index]["imageFetchType"] ??
                                '')) {
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
                                    asyncSnapshot.data[index]["picture"] ??
                                        Config.nullNetworkImage),
                              ),
                            ),
                            title:
                                Text(asyncSnapshot.data[index]["name"] ?? ''),
                            subtitle: Text(
                                "${asyncSnapshot.data[index]["email"] ?? ''} \nUsing CircleAvatar inside CircleAvatar"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDetails(
                                            email: asyncSnapshot.data[index]
                                                    ["email"] ??
                                                '',
                                            about: asyncSnapshot.data[index]
                                                    ["about"] ??
                                                '',
                                            name: asyncSnapshot.data[index]
                                                    ["name"] ??
                                                '',
                                            picture: asyncSnapshot.data[index]
                                                    ["picture"] ??
                                                Config.nullNetworkImage,
                                            imageFetchType:
                                                asyncSnapshot.data[index]
                                                        ["imageFetchType"] ??
                                                    '',
                                          )));
                            },
                          );
                        } else if (Config().equalsIgnoreCase(
                            "fadeInImage",
                            asyncSnapshot.data[index]["imageFetchType"] ??
                                '')) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: FadeInImage.assetNetwork(
                              placeholder: 'images/loading_dots.gif',
                              image: asyncSnapshot.data[index]["picture"] ??
                                  Config.nullNetworkImage,
                            ),
                            title:
                                Text(asyncSnapshot.data[index]["name"] ?? ''),
                            subtitle: Text(
                                "${asyncSnapshot.data[index]["email"] ?? ''} \nUsing Fade in image"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDetails(
                                            email: asyncSnapshot.data[index]
                                                    ["email"] ??
                                                '',
                                            about: asyncSnapshot.data[index]
                                                    ["about"] ??
                                                '',
                                            name: asyncSnapshot.data[index]
                                                    ["name"] ??
                                                '',
                                            picture: asyncSnapshot.data[index]
                                                    ["picture"] ??
                                                Config.nullNetworkImage,
                                            imageFetchType:
                                                asyncSnapshot.data[index]
                                                        ["imageFetchType"] ??
                                                    '',
                                          )));
                            },
                          );
                        } else if (Config().equalsIgnoreCase(
                            "circularFadeInImage",
                            asyncSnapshot.data[index]["imageFetchType"] ??
                                '')) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: ClipOval(
                                child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: "images/converging_dots.gif",
                                    image: asyncSnapshot.data[index]
                                            ["picture"] ??
                                        Config.nullNetworkImage),
                              ),
                            ),
                            title:
                                Text(asyncSnapshot.data[index]["name"] ?? ''),
                            subtitle: Text(
                                "${asyncSnapshot.data[index]["email"] ?? ''} \nUsing Circular Fade in image"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDetails(
                                            email: asyncSnapshot.data[index]
                                                    ["email"] ??
                                                '',
                                            about: asyncSnapshot.data[index]
                                                    ["about"] ??
                                                '',
                                            name: asyncSnapshot.data[index]
                                                    ["name"] ??
                                                '',
                                            picture: asyncSnapshot.data[index]
                                                    ["picture"] ??
                                                Config.nullNetworkImage,
                                            imageFetchType:
                                                asyncSnapshot.data[index]
                                                        ["imageFetchType"] ??
                                                    '',
                                          )));
                            },
                          );
                        } else if (Config().equalsIgnoreCase(
                            "circularFadeInImageWithBorder",
                            asyncSnapshot.data[index]["imageFetchType"] ??
                                '')) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: AspectRatio(
                              aspectRatio: 1 / 1,
                              child: CircleAvatar(
                                child: ClipOval(
                                  child: FadeInImage.assetNetwork(
                                      fit: BoxFit.cover,
                                      placeholder: "images/converging_dots.gif",
                                      image: asyncSnapshot.data[index]
                                              ["picture"] ??
                                          Config.nullNetworkImage),
                                ),
                              ),
                            ),
                            title:
                                Text(asyncSnapshot.data[index]["name"] ?? ''),
                            subtitle: Text(
                                "${asyncSnapshot.data[index]["email"] ?? ''} \nUsing Circular Fade in image with border"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDetails(
                                            email: asyncSnapshot.data[index]
                                                    ["email"] ??
                                                '',
                                            about: asyncSnapshot.data[index]
                                                    ["about"] ??
                                                '',
                                            name: asyncSnapshot.data[index]
                                                    ["name"] ??
                                                '',
                                            picture: asyncSnapshot.data[index]
                                                    ["picture"] ??
                                                Config.nullNetworkImage,
                                            imageFetchType:
                                                asyncSnapshot.data[index]
                                                        ["imageFetchType"] ??
                                                    '',
                                          )));
                            },
                          );
                        }
                        return ListTile(
                            contentPadding: const EdgeInsets.all(10),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  asyncSnapshot.data[index]["picture"] ??
                                      Config.nullNetworkImage),
                            ),
                            title:
                                Text(asyncSnapshot.data[index]["name"] ?? ''),
                            subtitle: Text(
                                "${asyncSnapshot.data[index]["email"] ?? ''} \nUsing NetworkImage with backgroundImage"),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserDetails(
                                            email: asyncSnapshot.data[index]
                                                    ["email"] ??
                                                '',
                                            about: asyncSnapshot.data[index]
                                                    ["about"] ??
                                                '',
                                            name: asyncSnapshot.data[index]
                                                    ["name"] ??
                                                '',
                                            picture: asyncSnapshot.data[index]
                                                    ["picture"] ??
                                                Config.nullNetworkImage,
                                            imageFetchType:
                                                asyncSnapshot.data[index]
                                                        ["imageFetchType"] ??
                                                    '',
                                          )));
                            });
                      },
                    ));
              }
            }),
      ),
    );
  }
}
