import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';
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
                  ScaffoldMessenger.of(context).showSnackBar(
                      Config.buildSnackBar(
                          "Card Tapped",
                          5,
                          const EdgeInsets.all(20),
                          const EdgeInsets.all(15),
                          Colors.deepOrange,
                          const Duration(milliseconds: 5000)));
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
                        const Divider(
                          thickness: 0.3,
                          color: Colors.black26,
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                margin: const EdgeInsets.only(
                                    left: 10, top: 1, bottom: 1),
                                width: 30,
                                height: 30,
                                child: Image.asset('icons/ic_gas.png'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 3, top: 3),
                                  child: Text(
                                    "Gas Platform",
                                    style: TextStyle(
                                        fontFamily: "andada_pro",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 3, top: 3),
                                  child: Text("Maldives"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 2, top: 2),
                                  child: Chip(
                                    label: Text(
                                      "Ksh ${Config.numberFormatter(double.parse("7000"))}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Padding(
                            padding: const EdgeInsets.all(1),
                            child: TextButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder()),
                                onPressed: () => ScaffoldMessenger.of(context)
                                    .showSnackBar(Config.buildSnackBar(
                                        "View More Tapped",
                                        5,
                                        const EdgeInsets.all(20),
                                        const EdgeInsets.all(15),
                                        Colors.black,
                                        const Duration(milliseconds: 5000))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "View More",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 15),
                                    ),
                                    Icon(Icons.arrow_forward)
                                  ],
                                )))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      Config.buildSnackBar(
                          "Card Tapped",
                          5,
                          const EdgeInsets.all(20),
                          const EdgeInsets.all(15),
                          Colors.deepOrange,
                          const Duration(milliseconds: 5000)));
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  // Bevel Sized
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(1),
                          child: Text("Beveled Rectangular Border Card"),
                        ),
                        const Divider(
                          thickness: 0.3,
                          color: Colors.black26,
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                margin: const EdgeInsets.only(
                                    left: 10, top: 1, bottom: 1),
                                width: 30,
                                height: 30,
                                child: Image.asset('icons/ic_back_pack.png'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 3, top: 3),
                                  child: Text(
                                    "Back Pack",
                                    style: TextStyle(
                                        fontFamily: "andada_pro",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 3, top: 3),
                                  child: Text("Patagonia"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 2, top: 2),
                                  child: Chip(
                                    label: Text(
                                      "Ksh ${Config.numberFormatter(double.parse("4500"))}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Padding(
                            padding: const EdgeInsets.all(1),
                            child: TextButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder()),
                                onPressed: () => ScaffoldMessenger.of(context)
                                    .showSnackBar(Config.buildSnackBar(
                                        "View More Tapped",
                                        5,
                                        const EdgeInsets.all(20),
                                        const EdgeInsets.all(15),
                                        Colors.black,
                                        const Duration(milliseconds: 5000))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "View More",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 15),
                                    ),
                                    Icon(Icons.arrow_forward)
                                  ],
                                )))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      Config.buildSnackBar(
                          "Card Tapped",
                          5,
                          const EdgeInsets.all(20),
                          const EdgeInsets.all(15),
                          Colors.deepOrange,
                          const Duration(milliseconds: 5000)));
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  // Bevel Sized
                  shape: const StadiumBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(1),
                          child: Text("Stadium Border Card"),
                        ),
                        const Divider(
                          thickness: 0.3,
                          color: Colors.black26,
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: const EdgeInsets.all(1),
                                margin: const EdgeInsets.only(
                                    left: 10, top: 1, bottom: 1),
                                width: 30,
                                height: 30,
                                child: Image.asset('icons/ic_pen.png'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 3, top: 3),
                                  child: Text(
                                    "Pen",
                                    style: TextStyle(
                                        fontFamily: "andada_pro",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15, bottom: 3, top: 3),
                                  child: Text("Patagonia"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, bottom: 2, top: 2),
                                  child: Chip(
                                    label: Text(
                                      "Ksh ${Config.numberFormatter(double.parse("100"))}",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        const Divider(),
                        Padding(
                            padding: const EdgeInsets.all(1),
                            child: TextButton(
                                style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder()),
                                onPressed: () => ScaffoldMessenger.of(context)
                                    .showSnackBar(Config.buildSnackBar(
                                        "View More Tapped",
                                        5,
                                        const EdgeInsets.all(20),
                                        const EdgeInsets.all(15),
                                        Colors.black,
                                        const Duration(milliseconds: 5000))),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "View More",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 15),
                                    ),
                                    Icon(Icons.arrow_forward)
                                  ],
                                )))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "Other Card Designs",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                    shape: RoundedRectangleBorder(
                        // card corner radius
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.white,
                    elevation: 10,
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [

                          ],
                        ))))
          ],
        )));
  }
}
