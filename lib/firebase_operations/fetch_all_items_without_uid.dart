import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:master_learn/classes/FirebaseItem.dart';
import 'package:master_learn/classes/config.dart';

class FetchAllItemsWithoutUid extends StatefulWidget {
  final appBarTitle;

  const FetchAllItemsWithoutUid({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<FetchAllItemsWithoutUid> createState() =>
      _FetchAllItemsWithoutUidState();
}

class _FetchAllItemsWithoutUidState extends State<FetchAllItemsWithoutUid> {
  late List<FirebaseItem> _itemsList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // fetching using didChangeDependencies no need of using future builder
    fetchItemsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: ListView.builder(
        shrinkWrap: true,
          itemCount: _itemsList.length,
          itemBuilder: (context, index) {
            //return Text(_itemsList[index].itemName ?? "");
            return Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                child: Card(
              elevation: 1,
              child: Column(
                children: [
              Text(_itemsList[index].itemName ?? ""),
              Text(_itemsList[index].itemPrice.toString()),
                ],
              ),
            ));
          }),
    );
  }

  Future fetchItemsList() async {

    WidgetsBinding.instance
        .addPostFrameCallback((_) {
      Config.loaderDialog(context);
    });

    // fetch using id
    var result1 = await FirebaseFirestore.instance.collection("collectionName").doc("userIdHere").get();

    var result = await FirebaseFirestore.instance.collection("itemsList").get();


    setState(() {
      _itemsList =
          List.from(result.docs.map((doc) => FirebaseItem.fromSnapshot(doc)));
    });

    Navigator.pop(context);
  }
}
