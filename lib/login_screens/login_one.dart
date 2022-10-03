import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/login_screens/login_one_details.dart';
import 'package:master_learn/widgets/blue_loader.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';

class LoginOne extends StatefulWidget {
  const LoginOne({Key? key}) : super(key: key);

  @override
  _LoginOneState createState() => _LoginOneState();
}

class _LoginOneState extends State<LoginOne> {
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  void login(String phoneNo, String pin) async {
    // showLoaderDialog(BuildContext context){
    //   AlertDialog alert = AlertDialog(
    //     content: iconProgressIndicator(),
    //   );
    //
    //   showDialog(barrierDismissible: false, context: context, builder: (BuildContext context) {
    //     return alert;
    //   });
    //
    // }

    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      //content: iconProgressIndicator(),
      content: blueLoader(),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          // prevent back button press
          return alert;
        });

    try {
      Response response = await post(
        Uri.parse(""),
        body: {"phoneNo": phoneNo, "pin": pin},
      ).timeout(const Duration(seconds: Config.responseTimeOutInSeconds));

      Logger().i("LoginOneResponseCode: ${response.statusCode}");

      if (response.statusCode == 200) {
        HashMap<String, dynamic> responseMap =
            HashMap<String, dynamic>.from(json.decode(response.body));

        Logger().i("ResponseSuccessStatus ${responseMap["success"]}");

        if (Config().equalsIgnoreCase(responseMap["success"], "1")) {
          LinkedHashMap<String, dynamic> responseLinkedHashMap =
              json.decode(response.body);

          Logger().i("ResponseMapConversionMethod1 $responseMap");
          Logger().i(
              "ResponseMapConversionUsingLinkedHashMap $responseLinkedHashMap");

          //Navigator.pop(context);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoginOneDetails(
                        id: responseMap["login"][0]["id"] ?? '',
                        fullName: responseMap["login"][0]["fullName"] ?? '',
                        phoneNo: responseMap["login"][0]["phoneNumber"] ?? '',
                        retailerId: responseMap["login"][0]["retailer"] ?? '',
                        retailerName:
                            responseMap["login"][0]["retailerName"] ?? '',
                        outletId: responseMap["login"][0]["outlet"] ?? '',
                        outletName: responseMap["login"][0]["outletName"] ?? '',
                        updatePin: responseMap["login"][0]["updatePin"] ?? '',
                        sessionId: responseMap["login"][0]["sessionId"] ?? '',
                        sessionPassCode:
                            responseMap["login"][0]["sessionPasscode"] ?? '',
                        success: responseMap["success"] ?? '',
                        message: responseMap["message"] ?? '',
                      )));
        } else if (Config().equalsIgnoreCase(responseMap["success"], "2")) {
          //Navigator.pop(context);
        }
      }
    } catch (e) {
      //Navigator.pop(context);

      Logger().wtf("LoginOneException: $e");
    }
  }

  FocusNode tfFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    //tfFocusNode = FocusNode();
  }

  @override
  void dispose() {
    tfFocusNode.dispose();

    super.dispose();
  }

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
      body: SingleChildScrollView(
          child: Column(
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
                // Text Form Field TextColor
                cursorColor: Config.accentColor,
                focusNode: tfFocusNode,
                decoration: InputDecoration(
                    //grepper dense text form field flutter
                    isDense: true,
                    //end grepper
                    // Underline color before inside click of TextFormField
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Config.primaryColor),
                    ),
                    // Underline color after inside click of TextFormField
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Config.accentColor),
                    ),
                    // Input decoration with labelText only
                    labelText: "Enter Pin",
                    // Label style focus and when not focused color
                    labelStyle: TextStyle(
                        color:
                            tfFocusNode.hasFocus ? Colors.amber : Colors.black),
                    // Start Icon
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      color: Config.primaryColor,
                    ),
                    // End Icon
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined,
                        color: Config.primaryColor),
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
                onPressed: () {
                  login(phoneNoController.text.toString(),
                      pinController.text.toString());
                },
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
      )),
    );
  }
}
