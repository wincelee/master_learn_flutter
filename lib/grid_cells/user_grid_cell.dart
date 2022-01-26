import 'package:flutter/material.dart';
import 'package:master_learn/classes/user.dart';

class UserGridCell extends StatefulWidget {
  /*final String index, name, picture;

  const UserGridCell(
      {Key? key,
      required this.index,
      required this.name,
      required this.picture})
      : super(key: key);*/

  final User user;

  const UserGridCell({Key? key, required this.user}) : super(key: key);

  @override
  _UserGridCellState createState() => _UserGridCellState();
}

class _UserGridCellState extends State<UserGridCell> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                    tag: "index${widget.user.index}",
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "images/converging_dots.gif",
                        image: "${widget.user.picture}",
                        width: 100,
                        height: 100)),
              )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "${widget.user.name}",
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
