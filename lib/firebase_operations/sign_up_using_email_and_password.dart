import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/firebase_operations/firebase_dashboard.dart';
import 'package:master_learn/firebase_operations/services/auth_service.dart';
import 'package:master_learn/widgets/marquee_widget.dart';

import '../classes/EdgeAlert.dart';
import '../classes/config.dart';

class SignUpUsingEmailAndPassword extends StatefulWidget {
  final String appBarTitle;

  const SignUpUsingEmailAndPassword({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<SignUpUsingEmailAndPassword> createState() =>
      _SignUpUsingEmailAndPasswordState();
}

class _SignUpUsingEmailAndPasswordState
    extends State<SignUpUsingEmailAndPassword> {
  /* Enable email/password sign in firebase console*/

  final _key = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          child: MarqueeWidget(
            direction: Axis.horizontal,
            child: Text(widget.appBarTitle),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
              Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name cannot be empty';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        )),
                    style: const TextStyle(color: Colors.black),
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email cannot be empty';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.black)),
                    style: const TextStyle(color: Colors.black),
                  )),
              Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password cannot be empty';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.black)),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )),
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    child: const Text('Sign Up'),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        Config().hideKeyboard();

                        initSignUp();
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void initSignUp() async {
    Config.loaderDialog(context);

    dynamic result = await _authService.signUpWithEmailAndPassword(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim());

    if (result == null) {
      Navigator.pop(context);

      EdgeAlert.show(context,
          title: 'Error',
          description: 'We encountered an error while processing your request',
          backgroundColor: Config.primaryColor,
          duration: 2,
          icon: Icons.error_outline,
          gravity: EdgeAlert.bottom);
    } else {
      Navigator.pop(context);

      if (result.runtimeType == FirebaseAuthException) {
        if (kDebugMode) {
          Logger().i("ErrorCode: ${result.code}");
        }

        EdgeAlert.show(context,
            title: 'Please try again',
            description: result.message,
            backgroundColor: Config.primaryColor,
            duration: 3,
            icon: Icons.info_outline,
            gravity: EdgeAlert.bottom);
      } else {
        Navigator.pop(context);

        EdgeAlert.show(context,
            title: 'Success',
            description: "Sign in was successful",
            backgroundColor: Config.accentColor,
            duration: 3,
            icon: Icons.info_outline,
            gravity: EdgeAlert.bottom);

        Logger().i("Result: ${result.toString()}");

        _nameController.clear();
        _emailController.clear();
        _passwordController.clear();

        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                const FirebaseDashBoard(appBarTitle: "Firebase Dashboard")));
      }
    }
  }
}
