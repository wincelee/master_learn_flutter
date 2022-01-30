import 'package:flutter/material.dart';

Widget unauthorized(String message) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 150,
            height: 150,
            child: Image.asset('images/unauthorized.png'),
          ),
        ),
      ),
      Center(
          child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            )),
      ))
    ],
  );
}
