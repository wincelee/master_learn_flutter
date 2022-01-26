import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/grid_view_cells/user_grid_cell.dart';
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
              child: FutureBuilder(
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
                      child: GridView.builder(
                          itemCount: asyncSnapshot.data.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: GridTile(
                                  child: UserGridCell(
                                index: asyncSnapshot.data[index]["index"]??Config.nullIndexHero,
                                name: asyncSnapshot.data[index]["name"]??'',
                                picture: asyncSnapshot.data[index]["picture"]??Config.nullNetworkImage,
                              )),
                              onTap: () {

                                Logger().i("GridIndex ${asyncSnapshot.data[index]["index"]}");
                              },
                            );
                          }),
                    );
                  }))
        ],
      ),
    );
  }
}
