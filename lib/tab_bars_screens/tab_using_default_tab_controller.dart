import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';

class TabUsingDefaultTabController extends StatefulWidget {
  final String appBarTitle;

  const TabUsingDefaultTabController({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<TabUsingDefaultTabController> createState() =>
      _TabUsingDefaultTabControllerState();
}

class _TabUsingDefaultTabControllerState
    extends State<TabUsingDefaultTabController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.appBarTitle),
          ),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: const [
                Flexible(
                    child: TabBar(
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.orange,
                  tabs: [
                    Tab(
                      child: Text("This is Tab 1"),
                      icon: Icon(Icons.account_box_outlined),
                    ),
                    Tab(
                      child: Text("This is Tab 2"),
                      icon: Icon(Icons.beach_access),
                    ),
                  ],
                )),
                Flexible(
                    child: TabBarView(
                  children: [
                    Text("You have selected tab 1"),
                    Text("You have selected tab 2")
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
