import 'package:flutter/material.dart';
import 'package:master_learn/my_navigation_drawer.dart';

class SignInUsingPhoneNo extends StatefulWidget {
  final String appBarTitle;

  const SignInUsingPhoneNo({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<SignInUsingPhoneNo> createState() => _SignInUsingPhoneNoState();
}

class _SignInUsingPhoneNoState extends State<SignInUsingPhoneNo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      drawer: const MyNavigationDrawer(),
    );
  }
}
