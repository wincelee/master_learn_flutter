import 'package:flutter/material.dart';

import '../navigation_drawer.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);

  static const String routeName = '/Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const NavigationDrawer(),
      body: const Center(child: Text("This is home")),
    );
  }
}
