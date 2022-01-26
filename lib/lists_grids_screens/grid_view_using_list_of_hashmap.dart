import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';
import 'package:master_learn/widgets/marquee_widget.dart';

class GridViewUsingHashMap extends StatefulWidget {
  const GridViewUsingHashMap({Key? key}) : super(key: key);

  @override
  _GridViewUsingHashMapState createState() => _GridViewUsingHashMapState();
}

class _GridViewUsingHashMapState extends State<GridViewUsingHashMap> {
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
            child: Text("[] Grid View Using List of HashMap"),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: FutureBuilder<List<HashMap<String, dynamic>>>(
                  future: AsyncFutures.fetchListsOfStringDynamicHashMap(),
                  builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                    if (asyncSnapshot.data == null) {
                      return iconProgressIndicator();
                    } else if (asyncSnapshot.hasError) {
                      if (kDebugMode) {
                        Logger().wtf(
                            "SimpleGridViewAsyncSnapshotHasError ${asyncSnapshot.error}");
                      }
                    }
                    return RefreshIndicator(
                      // background color
                      backgroundColor: Colors.white,
                      // refresh circular progress indicator color
                      color: Colors.green,
                      onRefresh: () async {
                        setState(() {
                          AsyncFutures.fetchListsOfStringDynamicHashMap();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          children:
                              asyncSnapshot.data.map<HashMap<String, dynamic>>(
                                      (e){
                                        return GridTile(
                                            child: Text("Voila"));
                                      })
                                  .toList(),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
