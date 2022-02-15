import 'package:flutter/material.dart';

Widget blueLoader() {
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

  return const Center(child: SizedBox(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      strokeWidth: 3.0,
    ),
    height: 100,
    width: 100,
  ));
}
