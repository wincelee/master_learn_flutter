import 'package:flutter/material.dart';
import 'package:master_learn/firebase_operations/firebase_registration.dart';
import 'package:master_learn/firebase_operations/services/authentication_service.dart';
import 'package:master_learn/navigation_drawer.dart';

class FirebaseOperations extends StatefulWidget {
  final appBarTitle;

  const FirebaseOperations({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<FirebaseOperations> createState() => _FirebaseOperationsState();
}

class _FirebaseOperationsState extends State<FirebaseOperations> {
  final _key = GlobalKey<FormState>();

  final AuthenticationService _authenticationService = AuthenticationService();

  final TextEditingController _emailController = TextEditingController(text: "");
  final TextEditingController _passwordController = TextEditingController(text: "");

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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const FirebaseRegistration()));
                },
              ),
              ElevatedButton(
                child: const Text('Sign In'),
                onPressed: () {
                  if (_key.currentState!.validate()) {
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

  void signInUser() async{
    //dynamic _authResult = await _authenticationService.loginUser()
  }
}
