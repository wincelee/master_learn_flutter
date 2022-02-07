import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:logger/logger.dart';
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

  Future populateItemsList() async {
    final itemsList = await AsyncFutures.fetchItems(
        "https://api.json-generator.com/templates/ueOoUwh5r44G/data");

    setState(() {
      this.itemsList = itemsList;
    });
  }

  @override
  void initState() {
    super.initState();

    populateItemsList();
  }

  onSearch(String searchValue) {}

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
          title: Container(
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
          ),
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
                              // dismissible: DismissiblePane(onDismissed: () {
                              //   onDismissedRemoveItem(
                              //       itemsList![index].id ?? "");
                              // }),
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
                                  onPressed:
                                      doNothing(context, "Share CallBack"),
                                  backgroundColor: Colors.blueAccent.shade400,
                                  foregroundColor: Colors.white,
                                  icon: Icons.check_box_outline_blank,
                                  label: 'Dialog',
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

    Logger().i("Called Before Build: True");

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        Logger().i("Called After Build: True");
        itemsList!.removeWhere((item) => item.id == itemId);
      });
    });
  }

  dialogSlidableAction(BuildContext context, String callBackName) {

  }

  void onDismissedRemoveItem(String itemId) {
    setState(() {
      itemsList!.removeWhere((item) => item.id == itemId);
    });
  }
}
