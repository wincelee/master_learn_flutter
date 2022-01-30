import 'package:flutter/material.dart';

Widget noData(String message) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset('images/no_data.png'),
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
