import 'package:flutter/material.dart';
import 'package:master_learn/my_navigation_drawer.dart';
import 'package:master_learn/tab_bars_screens/tab_bars_outside_app_bar.dart';
import 'package:master_learn/tab_bars_screens/tab_using_default_tab_controller.dart';

class TabBarsScreen extends StatefulWidget {
  final String title;

  const TabBarsScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<TabBarsScreen> createState() => _TabBarsScreenState();
}

class _TabBarsScreenState extends State<TabBarsScreen> {
  String tabBarsOutsideAppBar = "Tab Bars Outside App Bar";
  String tabsUsingDefaultTabController = "Tab Using Default Tab Controller";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4c4c00),
          title: Text(widget.title),
        ),
        drawer: const MyNavigationDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TabBarsOutsideAppBar(
                                    appBarTitle: tabBarsOutsideAppBar,
                                  )));
                    },
                    child: Text(tabBarsOutsideAppBar)),
              )),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TabUsingDefaultTabController(
                                  appBarTitle: tabsUsingDefaultTabController,
                                ))),
                    child: Text(tabsUsingDefaultTabController),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
