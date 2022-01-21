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
              strokeWidth: 5.0,
            ),
            height: 100,
            width: 100,
          ),
        ],
      ),
    ),
  );
}
