import 'package:flutter/material.dart';
import 'package:master_learn/lists_grids_screens/future_builder_list_using_hashmap.dart';
import 'package:master_learn/lists_grids_screens/future_builder_list_using_loop.dart';
import 'package:master_learn/lists_grids_screens/future_builder_list_without_loop.dart';
import 'package:master_learn/lists_grids_screens/grid_view_builder_using_list_of_hashmap.dart';
import 'package:master_learn/lists_grids_screens/grid_view_builder_using_users_list.dart';

import '../navigation_drawer.dart';

class FetchListsGrids extends StatefulWidget {
  const FetchListsGrids({Key? key}) : super(key: key);

  @override
  _FetchList createState() => _FetchList();
}

class _FetchList extends State<FetchListsGrids> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4c4c00),
        title: const Text("Fetch Lists Grids"),
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const FutureBuilderListUsingLoop())),
                    child: const Text(
                      "[] Future Builder Users Lists Using For Loop",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const FutureBuilderListWithoutLoop())),
                    child: const Text(
                      "[] Future Builder Users Lists Without For Loop",
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const FutureBuilderListUsingHashMap())),
                    child: const Text(
                      "[] Future Builder Users Lists Using HashMap",
                      style: TextStyle(color: Colors.brown, fontSize: 15),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const GridViewBuilderUsingHashMap())),
                    child: const Text(
                      "[] Grid View Builder Using List of HashMap",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const GridViewBuilderUsingUsersList())),
                    child: const Text(
                      "[] Grid View Builder Using Users List",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Elevated Button",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Elevated Button",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
