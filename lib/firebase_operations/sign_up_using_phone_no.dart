import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/navigation_drawer.dart';

import '../classes/EdgeAlert.dart';
import '../classes/config.dart';

class SignUpUsingPhoneNo extends StatefulWidget {

  final String appBarTitle;

  const SignUpUsingPhoneNo({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<SignUpUsingPhoneNo> createState() => _SignUpUsingPhoneNoState();
}

class _SignUpUsingPhoneNoState extends State<SignUpUsingPhoneNo> {

  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();

  String countryDial = "+254";

  String? verificationId;

  Future requestPhoneOtpVerification(String phoneNo) async {

    Config.loaderDialog(context);

    await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credentials) {
            Navigator.pop(context);
        },
        verificationFailed: (FirebaseException e) {

          Navigator.pop(context);

          EdgeAlert.show(context,
              title: 'We encountered an error while verifying',
              description: e.message,
              backgroundColor: Config.primaryColor,
              duration: 5,
              icon: Icons.error_outline_rounded,
              gravity: EdgeAlert.bottom);

          if(kDebugMode){
            Logger().i("RequestPhoneOtpVerificationException: $e");
          }
        },
        codeSent: (String verId, int? resendToken) {

          Navigator.pop(context);

          EdgeAlert.show(context,
              title: 'Success',
              description: "We have send an otp to $phoneNo",
              backgroundColor: Config.primaryColor,
              duration: 3,
              icon: Icons.info_outline,
              gravity: EdgeAlert.bottom);
        },
        codeAutoRetrievalTimeout: (String verId){

          Navigator.pop(context);

          EdgeAlert.show(context,
              title: 'Oops!',
              description: "It seems like this has taken way too long, please try again",
              backgroundColor: Config.primaryColor,
              duration: 3,
              icon: Icons.info_outline,
              gravity: EdgeAlert.bottom);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.appBarTitle),
        ),
        drawer: const NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Text(
                "Username",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8,),
              TextFormField(
                controller: userNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16,),
              Text(
                "Phone number",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IntlPhoneField(
                controller: phoneNoController,
                showCountryFlag: true,
                showDropdownIcon: true,
                initialValue: countryDial,
                disableLengthCheck: true,
                countries: const [
                  'KE',
                  'TZ',
                  'UG',
                  'BI',
                  'RW',
                  'CG',
                  'ET',
                  'SO',
                  'SS'
                ],
                onCountryChanged: (country) {
                  setState(() {
                    countryDial = "+" + country.dialCode;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(
                      RegExp("[0-9\u0660-\u0669]")),
                  FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                ],
              ),
              ElevatedButton(onPressed: () {
                if (userNameController.text.isEmpty) {
                  showSnackBarText("Username is required to proceed");
                } else if (phoneNoController.text.isEmpty) {
                  showSnackBarText("Phone number is required to proceed");
                } else if (countryDial == '+254') {
                  if (phoneNoController.text
                      .trim()
                      .length < 9) {
                    showSnackBarText("Phone number length is invalid");
                  }
                }

                Config().hideKeyboard();

                requestPhoneOtpVerification(countryDial + phoneNoController.text.trim());

              }, child: Text("Proceed".toUpperCase()))
            ],),
          ),
        ));
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
