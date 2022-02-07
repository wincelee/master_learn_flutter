import 'dart:async';

import 'package:flutter/material.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/classes/item2.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';
import 'package:master_learn/widgets/marquee_widget.dart';
import 'package:master_learn/widgets/my_widgets/my_custom_card_widget.dart';
import 'package:master_learn/widgets/search_lists_grids.dart';

class ClassListWithSearchCustomCard extends StatefulWidget {
  const ClassListWithSearchCustomCard({Key? key}) : super(key: key);

  @override
  _ClassListWithSearchCustomCardState createState() =>
      _ClassListWithSearchCustomCardState();
}

class _ClassListWithSearchCustomCardState
    extends State<ClassListWithSearchCustomCard> {
  String query = "";

  List<Item2>? itemsList;

  Timer? timer;

  Future populateItemsList() async {
    final itemsList = await AsyncFutures.fetchItems2(query);

    setState(() {
      this.itemsList = itemsList;
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void timerImpl(
    VoidCallback callback, {
    Duration duration = const Duration(milliseconds: 1),
  }) {
    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer(duration, callback);
  }

  @override
  void initState() {
    super.initState();

    populateItemsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: const SizedBox(
            child: MarqueeWidget(
              direction: Axis.horizontal,
              child: Text("[] Map Class Lists With Search Custom Cards"),
            ),
          ),
        ),
        body: Column(children: [
          initiateSearch(),
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
                          //return Text(asyncSnapshot.data.length.toString());
                          return myCustomCardWidget(
                              itemsList![index].id ?? "",
                              itemsList![index].title ?? "",
                              itemsList![index].subTitle ?? '',
                              itemsList![index].imageUrl ??
                                  Config.nullNetworkImage);
                        },
                      ));
                }
              },
            ),
          )
        ]));
  }

  Widget initiateSearch() => SearchListsGrids(
        text: query,
        hintText: "Search.....",
        onChanged: searchItems,
      );

  Future searchItems(String query) async => timerImpl(() async {
        final itemsList = await AsyncFutures.fetchItems2(query);

        if (!mounted) return;

        setState(() {
          this.query = query;
          this.itemsList = itemsList;
        });
      });
}
