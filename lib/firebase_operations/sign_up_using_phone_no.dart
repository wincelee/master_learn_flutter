import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/firebase_operations/firebase_dashboard.dart';
import 'package:master_learn/my_navigation_drawer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../classes/EdgeAlert.dart';
import '../classes/config.dart';

class SignUpUsingPhoneNo extends StatefulWidget {
  final String appBarTitle;

  const SignUpUsingPhoneNo({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<SignUpUsingPhoneNo> createState() => _SignUpUsingPhoneNoState();
}

enum ButtonClickOptions { sendOtp, verifyOtp }

class _SignUpUsingPhoneNoState extends State<SignUpUsingPhoneNo> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();

  String _countryDial = "+254";

  String? _verificationId, _otp;

  bool _setOtpDisplayVisibility = false;

  ButtonClickOptions _buttonClickOptions = ButtonClickOptions.sendOtp;

  Future requestPhoneOtpVerification(String phoneNo) async {
    Config.loaderDialog(context);

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
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

          if (kDebugMode) {
            Logger().i("RequestPhoneOtpVerificationException: $e");
          }
        },
        codeSent: (String verId, int? resendToken) {
          setState(() {
            _verificationId = verId;
            _setOtpDisplayVisibility = true;
            _buttonClickOptions = ButtonClickOptions.verifyOtp;
          });

          Navigator.pop(context);

          EdgeAlert.show(context,
              title: 'Success',
              description: "We have send an otp to $phoneNo",
              backgroundColor: Config.accentColor,
              duration: 3,
              icon: Icons.info_outline,
              gravity: EdgeAlert.bottom);
        },
        codeAutoRetrievalTimeout: (String verId) {
          Navigator.pop(context);

          EdgeAlert.show(context,
              title: 'Oops!',
              description:
                  "It seems like this has taken way too long, please try again",
              backgroundColor: Config.primaryColor,
              duration: 3,
              icon: Icons.info_outline,
              gravity: EdgeAlert.bottom);
        });
  }

  Future verifyOtp() async {
    Config.loaderDialog(context);

    await FirebaseAuth.instance
        .signInWithCredential(PhoneAuthProvider.credential(
            verificationId: _verificationId!, smsCode: _otp!))
        .whenComplete(() => {
              Navigator.pop(context),
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const FirebaseDashBoard(
                      appBarTitle:
                          "Firebase Dashboard from sign up using phone no"),
                ),
              )
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.appBarTitle),
        ),
        drawer: const MyNavigationDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Username",
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Phone number",
                  style: GoogleFonts.montserrat(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IntlPhoneField(
                  controller: _phoneNoController,
                  showCountryFlag: true,
                  showDropdownIcon: true,
                  initialValue: _countryDial,
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
                      _countryDial = "+" + country.dialCode;
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
                Visibility(
                    visible: _setOtpDisplayVisibility,
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 10, bottom: 10, left: 5, right: 5),
                      child:
                          Text("Enter opt sent to ${_phoneNoController.text}"),
                    )),
                Visibility(
                  visible: _setOtpDisplayVisibility,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    onChanged: (value) {
                      setState(() {
                        _otp = value;
                      });
                    },
                    pinTheme: PinTheme(
                      activeColor: Colors.blue,
                      selectedColor: Config.accentColor,
                      inactiveColor: Colors.black26,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 5, right: 5),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_buttonClickOptions ==
                              ButtonClickOptions.sendOtp) {
                            if (_userNameController.text.isEmpty) {
                              showSnackBarText(
                                  "Username is required to proceed");
                            } else if (_phoneNoController.text.isEmpty) {
                              showSnackBarText(
                                  "Phone number is required to proceed");
                            } else {
                              if (_countryDial == '+254') {
                                if (_phoneNoController.text.trim().length < 9) {
                                  showSnackBarText(
                                      "Phone number length is invalid");
                                } else {
                                  requestPhoneOtpVerification(_countryDial +
                                      _phoneNoController.text.trim());
                                }
                              } else {
                                requestPhoneOtpVerification(_countryDial +
                                    _phoneNoController.text.trim());
                              }
                            }
                          } else if (_buttonClickOptions ==
                              ButtonClickOptions.verifyOtp) {
                            if (_otp!.length >= 6) {
                              verifyOtp();
                            }
                          }

                          Config().hideKeyboard();
                        },
                        child: Text("Proceed".toUpperCase())))
              ],
            ),
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
