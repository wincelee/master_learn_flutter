import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/grid_cells/user_grid_cell.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';
import 'package:master_learn/widgets/marquee_widget.dart';

class GridViewUsingUsersList extends StatefulWidget {
  const GridViewUsingUsersList({Key? key}) : super(key: key);

  @override
  _GridViewUsingUsersListState createState() => _GridViewUsingUsersListState();
}

class _GridViewUsingUsersListState extends State<GridViewUsingUsersList> {
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
                  future: AsyncFutures.fetchUsersListWithoutLoop(),
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
                          AsyncFutures.fetchUsersListWithoutLoop();
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
                          asyncSnapshot.data.map((user) {
                            return GestureDetector(
                              child: GridTile(
                                  child: UserGridCell(user: user)),
                              onTap: () {},
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
