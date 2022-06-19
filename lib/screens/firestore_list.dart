import 'package:flutter/material.dart';

class FirestoreList extends StatefulWidget {

  final appBarTitle;

  const FirestoreList({Key? key, required this.appBarTitle}) : super(key: key);

  @override
  State<FirestoreList> createState() => _FirestoreListState();
}

class _FirestoreListState extends State<FirestoreList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle)
      ),
      body: SingleChildScrollView(

      ),
    );

  }
}
