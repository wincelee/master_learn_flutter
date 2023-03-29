import 'package:flutter/material.dart';
import 'package:master_learn/firebase_operations/sign_in_using_email_and_password.dart';
import 'package:master_learn/firebase_operations/sign_in_using_phone_no.dart';
import 'package:master_learn/firebase_operations/sign_up_using_phone_no.dart';
import 'package:master_learn/my_navigation_drawer.dart';

class FirebaseOperations extends StatefulWidget {
  final String appBarTitle;

  const FirebaseOperations({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<FirebaseOperations> createState() => _FirebaseOperationsState();
}

class _FirebaseOperationsState extends State<FirebaseOperations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      drawer: const MyNavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SignInUsingEmailAndPassword(
                                      appBarTitle:
                                          "Sign in using email and password",
                                    )));
                      },
                      child: const Text(
                          "Sign in | Sign up with email and password")),
                )),
            Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpUsingPhoneNo(
                                      appBarTitle: "Sign up using phone no",
                                    )));
                      },
                      child: const Text("Sign in | Sign up with phone no")),
                ))
          ],
        ),
      ),
    );
  }
}
