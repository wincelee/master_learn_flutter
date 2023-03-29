import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/my_navigation_drawer.dart';
import 'package:master_learn/widgets/my_custom_banner.dart';

class BannersScreen extends StatefulWidget {
  final String title;

  const BannersScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<BannersScreen> createState() => _BannersScreenState();
}

class _BannersScreenState extends State<BannersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const MyNavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 5, bottom: 5),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: const RoundedRectangleBorder(
                      // card corner radius
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  color: Colors.white,
                  elevation: 10,
                  child: Banner(
                    message: "Bugatti",
                    textStyle: const TextStyle(fontSize: 12),
                    location: BannerLocation.topStart,
                    color: Config.primaryColor,
                    child: Column(
                      children: [
                        SizedBox(
                          child: Image.asset("images/ic_bugatti.png"),
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 5, left: 5),
                            child: const Text(
                              "Default Banner From Flutter as Card child with Clip.antiAlias",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, right: 5, left: 5),
                            child: const Text(
                              "Banner has no padding or margin",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            )),
                        Container(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, right: 5, left: 5),
                            child: const Text(
                              "Banner location set to top start",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                  ),
                )),
            myCustomBanner(
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              child: Column(
                children: [
                  SizedBox(
                    child: Image.asset("images/ic_koenigsegg.jpg"),
                  ),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 10, bottom: 10, right: 5, left: 5),
                      child: const Text(
                        "Default Banner From Flutter as Card child with Clip.antiAlias",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      )),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 5, left: 5),
                      child: const Text(
                        "Banner has no padding or margin",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      )),
                  Container(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 5, left: 5),
                      child: const Text(
                        "Banner location set to top start",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
