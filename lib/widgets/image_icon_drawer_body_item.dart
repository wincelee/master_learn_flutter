import 'package:flutter/material.dart';

Widget imageIconDrawerBodyItem(
    {String? imageAssetPath, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          width: 25,
          height: 25,
          child: Image.asset(imageAssetPath!),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(text!),
        )
      ],
    ),
    onTap: onTap,
  );
}
