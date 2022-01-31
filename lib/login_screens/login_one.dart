import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_learn/classes/config.dart';

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
                decoration: const InputDecoration(
                    // Input decoration with both hintText and labelText
                    hintText: "Enter Phone Number",
                    labelText: "Enter Phone Number"),
                // Numbers Allow Decimals
                keyboardType: TextInputType.number,
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: pinController,
                decoration: const InputDecoration(
                    // Input decoration with labelText only
                    labelText: "Enter Pin",
                    // Start Icon
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    prefixIconColor: Color(0xff7e1416),
                    // End Icon
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    suffixIconColor: Config.primaryColor),
                // Numbers Keyboard
                keyboardType: TextInputType.number,
                // Numbers Only No Decimal
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                  // Or user below code
                  // FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                child: Text("Log In".toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    // Button Background Color
                    primary: Config.primaryColor,
                    // Ripple Color
                    onPrimary: Config.accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // Set Elevated Button Width and Height Respectively 200 and 50 using Size
                    minimumSize: const Size(300, 40),
                    maximumSize: const Size(300, 40)),
              )),
        ],
      ),
    );
  }
}
