import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/firebase_operations/firebase_dashboard.dart';
import 'package:master_learn/firebase_operations/sign_up_using_email_and_password.dart';
import 'package:master_learn/firebase_operations/services/auth_service.dart';
import 'package:master_learn/navigation_drawer.dart';

import '../classes/EdgeAlert.dart';
import '../classes/config.dart';

class SignInUsingEmailAndPassword extends StatefulWidget {
  final String appBarTitle;

  const SignInUsingEmailAndPassword({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<SignInUsingEmailAndPassword> createState() =>
      _SignInUsingEmailAndPasswordState();
}

class _SignInUsingEmailAndPasswordState
    extends State<SignInUsingEmailAndPassword> {
  final _key = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  final TextEditingController _emailController =
      TextEditingController(text: "manu@mail.com");
  final TextEditingController _passwordController =
      TextEditingController(text: "optimus20199");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.appBarTitle)),
      drawer: const NavigationDrawer(),
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
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ))),
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
                ),
              ),
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
                      ))),
              TextButton(
                child: const Text('Not registered? Sign up'),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SignUpUsingEmailAndPassword(
                                  appBarTitle:
                                      "Sign up using email and password")));
                },
              ),
              ElevatedButton(
                child: const Text('Sign In'),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    Config().hideKeyboard();

                    signInUser();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signInUser() async {
    Config.loaderDialog(context);

    dynamic _authResult = await _authService.signInWithEmailAndPassword(
        _emailController.text.trim(), _passwordController.text.trim());

    if (_authResult == null) {
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

      if (_authResult.runtimeType == FirebaseAuthException) {
        if (kDebugMode) {
          Logger().i("ErrorCode: ${_authResult.code}");
        }

        EdgeAlert.show(context,
            title: 'Please try again',
            description: _authResult.message,
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

        Logger().i("Result: ${_authResult.toString()}");

        _emailController.clear();
        _passwordController.clear();

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const FirebaseDashBoard(
                    appBarTitle: "Firebase Dashboard")));
      }
    }
  }
}
