import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';

Widget reusableRowWithChip(
    String image, String middleText, String chipEndText, Color chipEndColor) {
  return Padding(
    padding: const EdgeInsets.all(1),
    child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(1),
              margin:
                  const EdgeInsets.only(left: 5, top: 1, bottom: 1, right: 1),
              height: 30,
              width: 30,
              child: Image.asset(image),
              /*child: RenderUiImage(image: await Config.getUiImage(image, 500, 500)),*/
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 3, top: 3),
              child: Text(
                middleText,
              ))
        ],
      ),
      Expanded(
        child: Align(
            alignment: Alignment.centerRight,
            child: Chip(
              label: Text(
                "Ksh ${Config.numberFormatter(double.parse(chipEndText))}",
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: chipEndColor,
            )),
      )
    ]),
  );
}
