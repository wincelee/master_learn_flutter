import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/grid_view_cells/product_grid_cell.dart';
import 'package:master_learn/widgets/marquee_widget.dart';

class FetchAllItemsWithoutUsingClassWithoutUid extends StatefulWidget {
  final String appBarTitle;

  const FetchAllItemsWithoutUsingClassWithoutUid(
      {Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<FetchAllItemsWithoutUsingClassWithoutUid> createState() =>
      _FetchAllItemsWithoutUsingClassWithoutUidState();
}

class _FetchAllItemsWithoutUsingClassWithoutUidState
    extends State<FetchAllItemsWithoutUsingClassWithoutUid> {
  String productName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Card(
        child: TextField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search), hintText: 'Search...'),
          onChanged: (val) {
            setState(() {
              productName = val;
            });
          },
        ),
      )),
      body: Column(
        children: [
          productName.isEmpty
              ? Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("products")
                      .snapshots(),
                  builder: (context, snapshots) {
                    return (snapshots.connectionState ==
                            ConnectionState.waiting)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView.builder(
                            itemCount: snapshots.data!.docs.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              var data = snapshots.data!.docs[index].data()
                                  as Map<String, dynamic>;

                              var id = snapshots.data!.docs[index].reference.id;

                              Logger().i("FetchedId: $id");

                              return GridTile(
                                  child: ProductGridCell(
                                name: data['name'],
                                price: data['price'].toDouble(),
                                picture: data['picture'],
                              ));
                            });
                  },
                ))
              : Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("products")
                      .snapshots(),
                  builder: (context, snapshots) {
                    return (snapshots.connectionState ==
                            ConnectionState.waiting)
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            children: [
                              ...snapshots.data!.docs
                                  .where((QueryDocumentSnapshot<Object?>
                                          element) =>
                                      element['name']
                                          .toString()
                                          .toLowerCase()
                                          .contains(productName.toLowerCase()))
                                  .map((QueryDocumentSnapshot<Object?> data) {


                                var id = data.reference.id;

                                Logger().i("FetchedIdInSearch: $id");

                                return GridTile(
                                    child: ProductGridCell(
                                  name: data['name'],
                                  price: data['price'].toDouble(),
                                  picture: data['picture'],
                                ));
                              })
                            ],
                          );
                  },
                ))
        ],
      ),
    );
  }
}
