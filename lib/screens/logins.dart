import 'package:flutter/material.dart';
import 'package:master_learn/login_screens/login_one.dart';

import '../navigation_drawer.dart';

class Logins extends StatefulWidget {
  const Logins({Key? key}) : super(key: key);

  @override
  _LoginsState createState() => _LoginsState();
}

class _LoginsState extends State<Logins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4c4c00),
        title: const Text("Logins"),
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const LoginOne())),
                    child: const Text(
                      "Login One",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
