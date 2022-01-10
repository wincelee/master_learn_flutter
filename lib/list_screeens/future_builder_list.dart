import 'package:flutter/material.dart';

class FutureBuilderList extends StatefulWidget {
  const FutureBuilderList({Key? key}) : super(key: key);

  @override
  _FutureBuilderListState createState() => _FutureBuilderListState();
}

class _FutureBuilderListState extends State<FutureBuilderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text("Future Builder Users Array Lists"),
      ),
    );
  }
}
