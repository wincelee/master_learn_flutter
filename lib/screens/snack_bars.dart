import 'package:flutter/material.dart';
import 'package:master_learn/navigation_drawer.dart';

class SnackBars extends StatefulWidget {
  const SnackBars({Key? key}) : super(key: key);

  @override
  _SnackBarsState createState() => _SnackBarsState();
}

class _SnackBarsState extends State<SnackBars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4c4c00),
        title: const Text("SnackBars"),
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Normal Simple SnackBar",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Normal Simple SnackBar 2",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ],
        ),
      )),
    );
  }
}
