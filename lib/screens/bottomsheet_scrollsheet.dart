import 'package:flutter/material.dart';
import 'package:master_learn/navigation_drawer.dart';

class BottomSheetScrollSheet extends StatefulWidget {

  final String title;

  const BottomSheetScrollSheet({Key? key, required this.title}) : super(key: key);

  @override
  _BottomSheetScrollSheetState createState() => _BottomSheetScrollSheetState();
}

class _BottomSheetScrollSheetState extends State<BottomSheetScrollSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4c4c00),
        title: Text(widget.title),
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),
    );
  }

}
