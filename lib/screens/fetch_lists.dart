import 'package:flutter/material.dart';
import 'package:master_learn/list_screeens/future_builder_list.dart';

import '../navigation_drawer.dart';

class FetchList extends StatefulWidget {
  const FetchList({Key? key}) : super(key: key);

  @override
  _FetchList createState() => _FetchList();
}

class _FetchList extends State<FetchList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4c4c00),
        title: const Text("Fetch Lists"),
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (BuildContext context) => const FutureBuilderList())),
                    child: const Text(
                      "[] Future Builder Users Array Lists",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
