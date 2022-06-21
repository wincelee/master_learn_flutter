import 'package:flutter/material.dart';
import 'package:master_learn/navigation_drawer.dart';

class FirebaseDashBoard extends StatefulWidget {
  final appBarTitle;

  const FirebaseDashBoard({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<FirebaseDashBoard> createState() => _FirebaseDashBoardState();
}

class _FirebaseDashBoardState extends State<FirebaseDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
        actions: [
          Container(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: TextButton(
            onPressed: () {
            },
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
            style: OutlinedButton.styleFrom(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          )),
          Container(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: TextButton(
                onPressed: () {
                },
                child: const Icon(
                  Icons.login_outlined,
                  color: Colors.white,
                ),
                style: OutlinedButton.styleFrom(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ))
        ],
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index){
              return const Card(
                child: ListTile(
                  title: Text("Title"),
                  subtitle: Text("Subtitle"),
                  leading: CircleAvatar(
                    child: Image(image: AssetImage('icons/ic_google_pixel.png'),),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
