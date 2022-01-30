import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/grid_view_cells/user_grid_cell.dart';
import 'package:master_learn/lists_grids_screens/grid_cell_details.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';
import 'package:master_learn/widgets/marquee_widget.dart';
import 'package:master_learn/widgets/no_data.dart';
import 'package:master_learn/widgets/unauthorized.dart';

class GridViewBuilderUsingUsersList extends StatefulWidget {
  const GridViewBuilderUsingUsersList({Key? key}) : super(key: key);

  @override
  _GridViewBuilderUsingUsersListState createState() =>
      _GridViewBuilderUsingUsersListState();
}

class _GridViewBuilderUsingUsersListState
    extends State<GridViewBuilderUsingUsersList> {
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
            child: Text("[] Grid View Builder Using List of HashMap"),
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
                  future: AsyncFutures.fetchUsersListWithoutLoop(),
                  builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                    switch (asyncSnapshot.connectionState) {
                      case ConnectionState.none:
                        {
                          Logger().i("Connection None");
                        }
                        break;

                      case ConnectionState.waiting:
                        {
                          Logger().i("Connection Waiting");
                        }
                        break;

                      case ConnectionState.active:
                        if (kDebugMode) {
                          Logger().i("Connection Active");
                        }
                        break;

                      case ConnectionState.done:

                        if(asyncSnapshot.data.length == 0) {

                          //Logger().i("${AsyncFutures.statusCode()}");

                          //return unauthorized("We encountered an error while authorizing your request");
                          return noData("We haven't found any users right now please create a user or retry");
                        }
                        else if (asyncSnapshot.hasError) {
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
                              AsyncFutures.fetchUsersListWithoutLoop();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: GridView.builder(
                                itemCount: asyncSnapshot.data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    child: GridTile(
                                        child: UserGridCell(
                                      index: asyncSnapshot.data[index].index ??
                                          Config.nullIndexHero,
                                      name:
                                          asyncSnapshot.data[index].name ?? '',
                                      picture:
                                          asyncSnapshot.data[index].picture ??
                                              Config.nullNetworkImage,
                                    )),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GridCellDetails(
                                                    index: asyncSnapshot
                                                            .data[index]
                                                            .index ??
                                                        '',
                                                    email: asyncSnapshot
                                                            .data[index]
                                                            .email ??
                                                        '',
                                                    about: asyncSnapshot
                                                            .data[index]
                                                            .about ??
                                                        '',
                                                    name: asyncSnapshot
                                                            .data[index].name ??
                                                        '',
                                                    picture: asyncSnapshot
                                                            .data[index]
                                                            .picture ??
                                                        Config.nullNetworkImage,
                                                    imageFetchType: asyncSnapshot
                                                            .data[index]
                                                            .imageFetchType ??
                                                        '',
                                                  )));
                                    },
                                  );
                                }),
                          ),
                        );
                    }

                    return iconProgressIndicator();
                  }))
        ],
      ),
    );
  }
}
