import 'package:flutter/material.dart';

class LoginTwo extends StatefulWidget {

  final String title;

  const LoginTwo({Key? key, required this.title}) : super(key: key);

  @override
  _LoginTwoState createState() => _LoginTwoState();
}

class _LoginTwoState extends State<LoginTwo> {
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
          title: Text(widget.title),
        ),
    );
  }
}
