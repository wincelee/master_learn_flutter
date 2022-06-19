import 'package:flutter/material.dart';

class SimpleOptionsMenu extends StatefulWidget {

  final appBarTitle;

  const SimpleOptionsMenu({Key? key, required this.appBarTitle}) : super(key: key);

  @override
  State<SimpleOptionsMenu> createState() => _SimpleOptionsMenuState();
}

class _SimpleOptionsMenuState extends State<SimpleOptionsMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        actions: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: (){

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    elevation: 10,
                    content: Text('City clicked'),
                    margin: EdgeInsets.all(15),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 500),),

                );
              },
              child: Icon(Icons.location_city),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: (){

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    elevation: 10,
                    content: Text('Account clicked'),
                    margin: EdgeInsets.all(15),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(milliseconds: 500),),

                );

              },
              child: Icon(Icons.account_circle_sharp),
            ),
          )
        ],
      ),
    );
  }
}
