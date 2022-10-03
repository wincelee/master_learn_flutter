import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';

Widget myCustomBanner(
    {@required Widget? child, @required EdgeInsetsGeometry? margin}) {
  final rotateLeft = const AlwaysStoppedAnimation(-45 / 360);
  final rotateRight = const AlwaysStoppedAnimation(45 / 360);

  bool isRightBanner = true;
  bool isLeftBanner = false;

  return Container(
      margin: margin,
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
              // card corner radius
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          color: Colors.white,
          elevation: 10,
          child: Stack(
            children: <Widget>[
              Container(
                child: child,
              ),
              Positioned(
                  left: isLeftBanner ? -32 : null,
                  right: isRightBanner ? -32 : null,
                  top: 20,
                  child: RotationTransition(
                      turns: rotateRight,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 36),
                        child: Text(
                          "Banner Text",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        color: Colors.deepOrange,
                      )))
            ],
          )));
}

Widget buildBadge({@required Animation<double>? turns}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 36),
    child: Text("Banner Text"),
    color: Colors.deepOrange,
  );
}
