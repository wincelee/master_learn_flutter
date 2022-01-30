import 'package:flutter/material.dart';

class GridCellDetails extends StatefulWidget {
  final int index;
  final String email, about, name, picture, imageFetchType;

  const GridCellDetails(
      {Key? key,
      required this.index,
      required this.email,
      required this.about,
      required this.name,
      required this.picture,
      required this.imageFetchType})
      : super(key: key);

  @override
  _GridCellDetailsState createState() => _GridCellDetailsState();
}

class _GridCellDetailsState extends State<GridCellDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(widget.email),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Hero(
                      tag: widget.name,
                      child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "images/converging_dots.gif",
                          image: widget.picture,
                          width: 200,
                          height: 200)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
