import 'package:flutter/material.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';
import 'package:master_learn/widgets/marquee_widget.dart';
import 'package:master_learn/widgets/my_widgets/my_custom_card_widget.dart';

class MapListWithSearchCustomCard extends StatefulWidget {
  const MapListWithSearchCustomCard({Key? key}) : super(key: key);

  @override
  _MapListWithSearchCustomCardState createState() =>
      _MapListWithSearchCustomCardState();
}

class _MapListWithSearchCustomCardState
    extends State<MapListWithSearchCustomCard> {
  String query = "";

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
            child: Text("[] Map Lists With Search Custom Cards"),
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: FutureBuilder(
            future: AsyncFutures.fetchLists(
                "https://api.json-generator.com/templates/ueOoUwh5r44G/data",
                ""),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.data == null) {
                return iconProgressIndicator();
              } else {
                return RefreshIndicator(
                    // background color
                    backgroundColor: Colors.white,
                    // refresh circular progress indicator color
                    color: Colors.green,
                    onRefresh: () async {
                      setState(() {
                        AsyncFutures.fetchLists(
                            "https://api.json-generator.com/templates/ueOoUwh5r44G/data",
                            "");
                      });
                    },
                    child: ListView.builder(
                      itemCount: asyncSnapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        //return Text(asyncSnapshot.data.length.toString());
                        return myCustomCardWidget(
                            asyncSnapshot.data[index]["id"] ?? "",
                            asyncSnapshot.data[index]["title"] ?? "",
                            asyncSnapshot.data[index]["subTitle"] ?? '',
                            asyncSnapshot.data[index]["imageUrl"] ??
                                Config.nullNetworkImage);
                      },
                    ));
              }
            },
          ),
        )
      ]),
    );
  }

// Widget buildSearch() => SearchListsGrids(text: query, onChanged: onChanged, hintText: hintText)
}
