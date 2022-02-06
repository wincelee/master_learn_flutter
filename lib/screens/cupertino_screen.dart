import 'package:flutter/cupertino.dart';

class CupertinoScreen extends StatefulWidget {
  const CupertinoScreen({Key? key}) : super(key: key);

  @override
  _CupertinoScreenState createState() => _CupertinoScreenState();
}

class _CupertinoScreenState extends State<CupertinoScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Container(
            margin: const EdgeInsets.all(1),
            width: double.infinity,
            child: const Text(
              "This is a very long title bla bla",
              style: TextStyle(
                fontFamily: "andada_pro",
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          automaticallyImplyLeading: true,
        ),
        child: Center(
          child: CupertinoButton(
              onPressed: () {}, child: const Text('Open Back CupertinoPage')),
        ));
  }
}
