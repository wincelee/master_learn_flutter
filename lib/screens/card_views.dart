import 'package:flutter/material.dart';
import 'package:master_learn/navigation_drawer.dart';

class CardViews extends StatefulWidget {
  const CardViews({Key? key}) : super(key: key);

  @override
  _CardViewsState createState() => _CardViewsState();
}

class _CardViewsState extends State<CardViews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4c4c00),
          title: const Text("CardViews"),
        ),
        drawer: const NavigationDrawer(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    elevation: 5,
                    margin: EdgeInsets.all(20),
                    content: Text('Tapped'),
                    duration: Duration(milliseconds: 1000),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.blue,
                  ));
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      // card corner radius
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(1),
                          child: Text("Rounded Rectangular Border Card"),
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10, top: 1, bottom: 1),
                                width: 30,
                                height: 100,
                                child: Image.asset('icons/ic_gas.png'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 15, bottom: 2),
                                  child: Text(
                                    "Gas Platform",
                                    style: TextStyle(
                                        fontFamily: "andada_pro",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 2, top: 2),
                                  child: Text("Maldives"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(1),
                                  child: Text("500"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text("Voila"),
            )
          ],
        )));
  }
}
