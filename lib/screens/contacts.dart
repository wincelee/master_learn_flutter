import 'package:flutter/material.dart';

import '../navigation_drawer.dart';

class Contacts extends StatelessWidget {

  const Contacts({Key? key}) : super(key: key);

  static const String routeName = '/Contacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacts"),
      ),
      drawer: const NavigationDrawer(),
      body: const Center(child: Text("This is contacts")),
    );
  }
}
