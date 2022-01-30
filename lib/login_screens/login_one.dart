import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginOne extends StatefulWidget {
  const LoginOne({Key? key}) : super(key: key);

  @override
  _LoginOneState createState() => _LoginOneState();
}

class _LoginOneState extends State<LoginOne> {
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController pinController = TextEditingController();

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
        title: const Text("Login One"),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: phoneNoController,
                  decoration:
                      const InputDecoration(hintText: "Enter Phone Number"),
                  // Numbers Allow Decimals
                  keyboardType: TextInputType.number,
                  )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: pinController,
                decoration: const InputDecoration(hintText: "Enter Pin"),
                // Numbers Keyboard
                keyboardType: TextInputType.number,
                // Numbers Only No Decimal
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                  // Or user below code
                  // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              ))
        ],
      ),
    );
  }
}
