import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/classes/item.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';
import 'package:master_learn/widgets/my_widgets/my_custom_card_widget.dart';

class ClassListWithSearchOnAppBarCustomCard extends StatefulWidget {
  const ClassListWithSearchOnAppBarCustomCard({Key? key}) : super(key: key);

  @override
  _ClassListWithSearchOnAppBarCustomCardState createState() =>
      _ClassListWithSearchOnAppBarCustomCardState();
}

class _ClassListWithSearchOnAppBarCustomCardState
    extends State<ClassListWithSearchOnAppBarCustomCard> {
  List<Item>? itemsList;
  List<Item>? searchList;

  Future populateItemsList() async {
    final itemsList = await AsyncFutures.fetchItems(
        "https://api.json-generator.com/templates/ueOoUwh5r44G/data");

    setState(() {
      this.itemsList = itemsList;
      searchList = itemsList;
    });
  }

  @override
  void initState() {
    super.initState();

    populateItemsList();
  }

  onSearch(String searchValue) {
    setState(() {
      itemsList = searchList!
          .where((item) => item.id!.toLowerCase().contains(searchValue))
          .toList();

      if (itemsList!.isEmpty) {
        itemsList = searchList!
            .where((item) => item.title!.toLowerCase().contains(searchValue))
            .toList();
      }

      if (itemsList!.isEmpty) {
        itemsList = searchList!
            .where((item) => item.subTitle!.toLowerCase().contains(searchValue))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade900,
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const Text("SearchBar"),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate(itemsList: itemsList));
                },
                icon: const Icon(Icons.search))
          ],

          /*Container(
            child: TextField(
              onChanged: (value) => onSearch(value),
              cursorHeight: 21.0,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[850],
                  contentPadding: EdgeInsets.all(0),
                  prefix: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none),
                  hintStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade500),
                  hintText: "Search"),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),*/
        ),
        body: Column(children: [
          Expanded(
            child: Builder(
              builder: (BuildContext context) {
                if (itemsList == null) {
                  return iconProgressIndicator();
                } else {
                  return RefreshIndicator(
                    // background color
                      backgroundColor: Colors.white,
                      // refresh circular progress indicator color
                      color: Colors.green,
                      onRefresh: () async {
                        setState(() {
                          populateItemsList();
                        });
                      },
                      child: ListView.builder(
                        itemCount: itemsList!.length,
                        itemBuilder: (BuildContext context, int index) {
                          // flutter_slidable: ^1.2.0
                          // import 'package:flutter_slidable/flutter_slidable.dart';
                          return Slidable(
                            // Specify whether the slider is dismissible
                            key: const ValueKey(1),
                            // Sliding from left to right
                            startActionPane: ActionPane(
                              // Types of Motion
                              // Behind Motion, Drawer Motion, Scroll Motion , Stretch Motion
                              motion: const DrawerMotion(),
                              dismissible: DismissiblePane(onDismissed: () {
                                onDismissedRemoveItem(
                                    itemsList![index].id ?? "");
                              }),
                              children: [
                                // Start this side with delete action if you have already implemented dismissible
                                // If Start with other slidable action create a new method for the slidable with a build context
                                SlidableAction(
                                  onPressed: deleteSlidableAction(
                                      context, itemsList![index].id ?? ""),
                                  backgroundColor: Colors.red.shade500,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                                SlidableAction(
                                  onPressed: dialogSlidableAction(
                                      context, itemsList![index].id ?? ""),
                                  backgroundColor: Colors.blueAccent.shade400,
                                  foregroundColor: Colors.white,
                                  icon: Icons.favorite_outlined,
                                  label: 'Favorites',
                                ),
                              ],
                            ),
                            endActionPane: ActionPane(
                              // Types of Motion
                              // Behind Motion, Drawer Motion, Scroll Motion , Stretch Motion
                              motion: const DrawerMotion(),
                              dismissible: DismissiblePane(onDismissed: () {
                                onDismissedRemoveItem(
                                    itemsList![index].id ?? "");
                              }),
                              children: [
                                // Start this side with delete action if you have already implemented dismissible
                                // If Start with other slidable action create a new method for the slidable with a build context
                                SlidableAction(
                                  onPressed: dialogSlidableAction(
                                      context, itemsList![index].id ?? ""),
                                  backgroundColor: Colors.blueAccent.shade400,
                                  foregroundColor: Colors.white,
                                  icon: Icons.favorite_outlined,
                                  label: 'Favorites',
                                ),
                                SlidableAction(
                                  onPressed: deleteSlidableAction(
                                      context, itemsList![index].id ?? ""),
                                  backgroundColor: Colors.red.shade500,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Delete',
                                ),
                              ],
                            ),
                            child: myCustomCardWidget(
                                itemsList![index].id ?? "",
                                itemsList![index].title ?? "",
                                itemsList![index].subTitle ?? '',
                                itemsList![index].imageUrl ??
                                    Config.nullNetworkImage),
                          );
                        },
                      ));
                }
              },
            ),
          )
        ]));
  }

  deleteSlidableAction(BuildContext context, String? itemId) {
    /*WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        itemsList!.removeWhere((item) => item.id == itemId);
      });
    });*/
  }

  dialogSlidableAction(BuildContext context, String callBackName) {
    /*SchedulerBinding.instance!.addPostFrameCallback((_) {
      showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          content: const Text('Are you sure you want to archive?'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: const Text('No'),
              onPressed: () {},
            ),
          ],
        ),
      );
    });*/
  }

  void onDismissedRemoveItem(String itemId) {
    setState(() {
      itemsList!.removeWhere((item) => item.id == itemId);
    });
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate({
    required this.itemsList,
  });

  final List<Item>? itemsList;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear_rounded)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation,));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Item>? searchList;

    for (var item in itemsList!) {
      if (item.id!.toLowerCase().contains(query.toLowerCase())) {
        searchList!.add(item);
      }

      if (item.title!.toLowerCase().contains(query.toLowerCase())) {
        searchList!.add(item);
      }

      if (item.subTitle!.toLowerCase().contains(query.toLowerCase())) {
        searchList!.add(item);
      }
    }

    return ListView.builder(
        itemCount: searchList!.length,
        itemBuilder: (context, index) =>
            myCustomCardWidget(
                searchList[index].id ?? "",
                searchList[index].title ?? "",
                searchList[index].subTitle ?? '',
                searchList[index].imageUrl ?? Config.nullNetworkImage)
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Item>? searchList;

    for (var item in itemsList!) {
      if (item.id!.toLowerCase().contains(query.toLowerCase())) {
        searchList!.add(item);
      }

      if (item.title!.toLowerCase().contains(query.toLowerCase())) {
        searchList!.add(item);
      }

      if (item.subTitle!.toLowerCase().contains(query.toLowerCase())) {
        searchList!.add(item);
      }
    }

    return ListView.builder(
        itemCount: searchList!.length,
        itemBuilder: (context, index) =>
            myCustomCardWidget(
                searchList[index].id ?? "",
                searchList[index].title ?? "",
                searchList[index].subTitle ?? '',
                searchList[index].imageUrl ?? Config.nullNetworkImage)
    );
  }
}
