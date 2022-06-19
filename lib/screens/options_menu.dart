import 'package:flutter/material.dart';
import 'package:master_learn/navigation_drawer.dart';
import 'package:master_learn/options_menu_screens/options_menu_with_icons.dart';
import 'package:master_learn/options_menu_screens/simple_options_menu.dart';

class OptionsMenu extends StatefulWidget {

  final String title;

  const OptionsMenu({Key? key, required this.title}) : super(key: key);

  @override
  State<OptionsMenu> createState() => _OptionsMenuState();
}

class _OptionsMenuState extends State<OptionsMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => const OptionsMenuWithIcons(title: "Options Menu With Icons",)));
                },
                child: const Text("Options Menu With Icons"),
              ),
            )),
            Center(child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (BuildContext context) => const SimpleOptionsMenu(appBarTitle: "Options Menu With Icons",)));
                },
                child: const Text("Simple Options Menu"),
              ),
            ))
          ],
        ),
      ),
    );
  }

}
