import 'package:flutter/material.dart';

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
          children: [
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: const Color(0xff123456),
                  borderRadius: BorderRadius.circular(20)),
              child: OutlinedButton(
                style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                ),
                onPressed: () {},
                child: const Text('Login',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
