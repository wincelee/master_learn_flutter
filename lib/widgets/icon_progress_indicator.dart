import 'package:flutter/material.dart';

Widget iconProgressIndicator() {
  return Center(
    child: SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset('images/cloud_download.png'),
          ),
          // you can replace
          const SizedBox(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              strokeWidth: 2.0,
            ),
            height: 100,
            width: 100,
          ),
        ],
      ),
    ),
  );

  // return Center(
  //   child: Image.asset(
  //     "images/metaball.gif",
  //   ),
  // );

  // return Center(
  //   child: Container(
  //     decoration: const BoxDecoration(
  //       shape: BoxShape.circle,
  //     ),
  //     height: 200,
  //     width: 200,
  //     margin: const EdgeInsets.all(1),
  //     padding: const EdgeInsets.all(1),
  //     child: Image.asset("images/metaball.gif"),
  //   ),
  // );
}
