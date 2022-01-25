import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/classes/future_fetch_lists.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';
import 'package:master_learn/widgets/marquee_widget.dart';

class SimpleGridView extends StatefulWidget {
  const SimpleGridView({Key? key}) : super(key: key);

  @override
  _SimpleGridViewState createState() => _SimpleGridViewState();
}

class _SimpleGridViewState extends State<SimpleGridView> {
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
            child: Text("[] Simple Grid View"),
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
                  future: fetchUsersUsingListOfStringDynamicHashMap(),
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
                        setState(() {});
                      },
                      child: Text("Welcome"),
                    );
                  }))
        ],
      ),
    );
  }
}
