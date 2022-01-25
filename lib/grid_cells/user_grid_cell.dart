import 'package:flutter/material.dart';

class UserGridCell extends StatelessWidget {
  final index, name, picture;

  const UserGridCell(
      {Key? key,
      required this.index,
      required this.name,
      required this.picture})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          // card corner radius
          borderRadius: BorderRadius.circular(10)),
      // card color
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:  MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(tag: "index$index", child: ""),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
