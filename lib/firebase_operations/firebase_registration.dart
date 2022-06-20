import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/firebase_operations/services/authentication_service.dart';

import '../classes/EdgeAlert.dart';
import '../classes/config.dart';

class FirebaseRegistration extends StatefulWidget {
  const FirebaseRegistration({Key? key}) : super(key: key);

  @override
  State<FirebaseRegistration> createState() => _FirebaseRegistrationState();
}

class _FirebaseRegistrationState extends State<FirebaseRegistration> {
  /* Enable email/password sign in firebase console*/

  final _key = GlobalKey<FormState>();

  final AuthenticationService _authenticationService = AuthenticationService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

                        createUser();
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void createUser() async {

    Config.loaderDialog(context);

    dynamic result = await _authenticationService.createNewUser(
        _emailController.text.trim(), _passwordController.text.trim());

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

      if(result.runtimeType == FirebaseAuthException){

        EdgeAlert.show(context,
            title: 'Please try again',
            description: result.toString(),
            backgroundColor: Config.primaryColor,
            duration: 2,
            icon: Icons.info_outline,
            gravity: EdgeAlert.bottom);
      }else{
        Logger().i("Result: ${result.toString()}");
      }

    }
  }
}
