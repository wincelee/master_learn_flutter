import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';

class ProductGridCell extends StatefulWidget {
  final String name, picture;
  final double price;

  const ProductGridCell(
      {Key? key,
      required this.name,
      required this.picture,
      required this.price})
      : super(key: key);

  @override
  State<ProductGridCell> createState() => _ProductGridCellState();
}

class _ProductGridCellState extends State<ProductGridCell> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "images/converging_dots.gif",
                          image: widget.picture,
                          width: 100,
                          height: 100),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(widget.name,
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w200,
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text("Ksh ${Config.numberFormatter(widget.price)}",
                  maxLines: 1,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
