import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';

Widget myCustomBanner({@required Widget? child}) {

  final rotateLeft = const AlwaysStoppedAnimation(-45/360);
  final rotateRight = const AlwaysStoppedAnimation(45/360);

  return Stack(
    children: <Widget>[
      Container(
        child: child,
      ),
      Positioned(
          child: RotationTransition(
              turns: rotateLeft,
              child: Container(
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 36),
            child: Text("Banner Text", style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.white
            ),),
            color: Colors.deepOrange,
          )))
    ],
  );
}

Widget buildBadge({@required Animation<double>? turns}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8,horizontal: 36),
    child: Text("Banner Text"),
    color: Colors.deepOrange,
  );
}


