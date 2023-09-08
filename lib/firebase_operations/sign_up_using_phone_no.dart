import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/countries.dart';
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
                    // get below country classes from import 'package:intl_phone_field/countries.dart';
                    Country(
                      name: "Kenya",
                      nameTranslations: {
                        "sk": "Keňa",
                        "se": "Kenia",
                        "pl": "Kenia",
                        "no": "Kenya",
                        "ja": "ケニア",
                        "it": "Kenya",
                        "zh": "肯尼亚",
                        "nl": "Kenia",
                        "de": "Kenia",
                        "fr": "Kenya",
                        "es": "Kenia",
                        "en": "Kenya",
                        "pt_BR": "Quênia",
                        "sr-Cyrl": "Кенија",
                        "sr-Latn": "Kenija",
                        "zh_TW": "肯亞",
                        "tr": "Kenya",
                        "ro": "Kenya",
                        "ar": "كينيا",
                        "fa": "كنيا",
                        "yue": "肯雅"
                      },
                      flag: "🇰🇪",
                      code: "KE",
                      dialCode: "254",
                      minLength: 10,
                      maxLength: 10,
                    ),
                    Country(
                      name: "Tanzania, United Republic of Tanzania",
                      nameTranslations: {
                        "sk": "Tanzánia",
                        "se": "Tanzánia",
                        "pl": "Tanzania",
                        "no": "Tanzania",
                        "ja": "タンザニア",
                        "it": "Tanzania",
                        "zh": "坦桑尼亚",
                        "nl": "Tanzania",
                        "de": "Tansania",
                        "fr": "Tanzanie",
                        "es": "Tanzania",
                        "en": "Tanzania",
                        "pt_BR": "Tanzânia",
                        "sr-Cyrl": "Танзанија",
                        "sr-Latn": "Tanzanija",
                        "zh_TW": "坦尚尼亞",
                        "tr": "Tanzanya",
                        "ro": "Tanzania",
                        "ar": "تنزانيا",
                        "fa": "تانزانیا",
                        "yue": "坦桑尼亞，聯合共和國"
                      },
                      flag: "🇹🇿",
                      code: "TZ",
                      dialCode: "255",
                      minLength: 9,
                      maxLength: 9,
                    ),
                    Country(
                      name: "Uganda",
                      nameTranslations: {
                        "sk": "Uganda",
                        "se": "Uganda",
                        "pl": "Uganda",
                        "no": "Uganda",
                        "ja": "ウガンダ",
                        "it": "Uganda",
                        "zh": "乌干达",
                        "nl": "Oeganda",
                        "de": "Uganda",
                        "fr": "Ouganda",
                        "es": "Uganda",
                        "en": "Uganda",
                        "pt_BR": "Uganda",
                        "sr-Cyrl": "Уганда",
                        "sr-Latn": "Uganda",
                        "zh_TW": "烏干達",
                        "tr": "Uganda",
                        "ro": "Uganda",
                        "ar": "أوغندا",
                        "fa": "اوگاندا",
                        "yue": "烏干達"
                      },
                      flag: "🇺🇬",
                      code: "UG",
                      dialCode: "256",
                      minLength: 9,
                      maxLength: 9,
                    ),
                    Country(
                      name: "Burundi",
                      nameTranslations: {
                        "sk": "Burundi",
                        "se": "Burundi",
                        "pl": "Burundi",
                        "no": "Burundi",
                        "ja": "ブルンジ",
                        "it": "Burundi",
                        "zh": "布隆迪",
                        "nl": "Burundi",
                        "de": "Burundi",
                        "fr": "Burundi",
                        "es": "Burundi",
                        "en": "Burundi",
                        "pt_BR": "Burundi",
                        "sr-Cyrl": "Бурунди",
                        "sr-Latn": "Burundi",
                        "zh_TW": "蒲隆地",
                        "tr": "Burundi",
                        "ro": "Burundi",
                        "ar": "بوروندي",
                        "fa": "بوروندی",
                        "yue": "蒲隆地"
                      },
                      flag: "🇧🇮",
                      code: "BI",
                      dialCode: "257",
                      minLength: 8,
                      maxLength: 8,
                    ),
                    Country(
                      name: "Rwanda",
                      nameTranslations: {
                        "sk": "Rwanda",
                        "se": "Rwanda",
                        "pl": "Rwanda",
                        "no": "Rwanda",
                        "ja": "ルワンダ",
                        "it": "Ruanda",
                        "zh": "卢旺达",
                        "nl": "Rwanda",
                        "de": "Ruanda",
                        "fr": "Rwanda",
                        "es": "Ruanda",
                        "en": "Rwanda",
                        "pt_BR": "Ruanda",
                        "sr-Cyrl": "Руанда",
                        "sr-Latn": "Ruanda",
                        "zh_TW": "盧安達",
                        "tr": "Ruanda",
                        "ro": "Rwanda",
                        "ar": "رواندا",
                        "fa": "رواندا",
                        "yue": "盧旺達"
                      },
                      flag: "🇷🇼",
                      code: "RW",
                      dialCode: "250",
                      minLength: 9,
                      maxLength: 9,
                    ),
                    Country(
                      name: "Congo",
                      nameTranslations: {
                        "sk": "Konžská republika",
                        "se": "Kongo-Brazzaville",
                        "pl": "Kongo",
                        "no": "Kongo-Brazzaville",
                        "ja": "コンゴ共和国(ブラザビル)",
                        "it": "Congo-Brazzaville",
                        "zh": "刚果（布）",
                        "nl": "Congo-Brazzaville",
                        "de": "Kongo-Brazzaville",
                        "fr": "Congo-Brazzaville",
                        "es": "Congo",
                        "en": "Congo - Brazzaville",
                        "pt_BR": "República do Congo",
                        "sr-Cyrl": "Република Конго",
                        "sr-Latn": "Republika Kongo",
                        "zh_TW": "剛果共和國（布拉柴維爾）",
                        "tr": "Kongo Cumhuriyeti",
                        "ro": "Republica Congo",
                        "ar": "جمهورية الكونغو",
                        "fa": "جمهوری کنگو",
                        "yue": "剛果（共和國）"
                      },
                      flag: "🇨🇬",
                      code: "CG",
                      dialCode: "242",
                      minLength: 7,
                      maxLength: 7,
                    ),
                    Country(
                      name: "Ethiopia",
                      nameTranslations: {
                        "sk": "Etiópia",
                        "se": "Etiopia",
                        "pl": "Etiopia",
                        "no": "Etiopia",
                        "ja": "エチオピア",
                        "it": "Etiopia",
                        "zh": "埃塞俄比亚",
                        "nl": "Ethiopië",
                        "de": "Äthiopien",
                        "fr": "Éthiopie",
                        "es": "Etiopía",
                        "en": "Ethiopia",
                        "pt_BR": "Etiópia",
                        "sr-Cyrl": "Етиопија",
                        "sr-Latn": "Etiopija",
                        "zh_TW": "伊索比亞",
                        "tr": "Etiyopya",
                        "ro": "Etiopia",
                        "ar": "إثيوبيا",
                        "fa": "اتیوپی",
                        "yue": "埃塞俄比亞"
                      },
                      flag: "🇪🇹",
                      code: "ET",
                      dialCode: "251",
                      minLength: 9,
                      maxLength: 9,
                    ),
                    Country(
                      name: "Somalia",
                      nameTranslations: {
                        "sk": "Somálsko",
                        "se": "Somália",
                        "pl": "Somalia",
                        "no": "Somalia",
                        "ja": "ソマリア",
                        "it": "Somalia",
                        "zh": "索马里",
                        "nl": "Somalië",
                        "de": "Somalia",
                        "fr": "Somalie",
                        "es": "Somalia",
                        "en": "Somalia",
                        "pt_BR": "Somália",
                        "sr-Cyrl": "Сомалија",
                        "sr-Latn": "Somalija",
                        "zh_TW": "索馬利亞",
                        "tr": "Somali",
                        "ro": "Somalia",
                        "ar": "الصومال",
                        "fa": "سومالی",
                        "yue": "索馬里"
                      },
                      flag: "🇸🇴",
                      code: "SO",
                      dialCode: "252",
                      minLength: 8,
                      maxLength: 8,
                    ),
                    Country(
                      name: "South Sudan",
                      nameTranslations: {
                        "sk": "Južný Sudán",
                        "se": "Máttasudan",
                        "pl": "Sudan Południowy",
                        "no": "Sør-Sudan",
                        "ja": "南スーダン",
                        "it": "Sud Sudan",
                        "zh": "南苏丹",
                        "nl": "Zuid-Soedan",
                        "de": "Südsudan",
                        "fr": "Soudan du Sud",
                        "es": "Sudán del Sur",
                        "en": "South Sudan",
                        "pt_BR": "Sudão do Sul",
                        "sr-Cyrl": "Јужни Судан",
                        "sr-Latn": "Južni Sudan",
                        "zh_TW": "南蘇丹",
                        "tr": "Güney Sudan",
                        "ro": "Sudanul de Sud",
                        "ar": "جنوب السودان",
                        "fa": "سودان جنوبی",
                        "yue": "南蘇丹"
                      },
                      flag: "🇸🇸",
                      code: "SS",
                      dialCode: "211",
                      minLength: 9,
                      maxLength: 9,
                    )
                  ],
                  // Old Implementation
                  /*countries: const [
                    'KE',
                    'TZ',
                    'UG',
                    'BI',
                    'RW',
                    'CG',
                    'ET',
                    'SO',
                    'SS'
                  ],*/
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
