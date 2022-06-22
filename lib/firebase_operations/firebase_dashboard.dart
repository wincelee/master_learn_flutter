import 'package:flutter/material.dart';
import 'package:master_learn/classes/EdgeAlert.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/firebase_operations/services/auth_service.dart';
import 'package:master_learn/navigation_drawer.dart';
import 'package:master_learn/screens/firebase_operations.dart';

class FirebaseDashBoard extends StatefulWidget {
  final appBarTitle;

  const FirebaseDashBoard({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<FirebaseDashBoard> createState() => _FirebaseDashBoardState();
}

class _FirebaseDashBoardState extends State<FirebaseDashBoard> {
  final AuthService _authService = AuthService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _scoreController = TextEditingController();

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
                  openDialogBox(context);
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
                onPressed: () async {
                  await _authService.signOut().then((result) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FirebaseOperations(
                            appBarTitle: "Firebase Operations")));

                    EdgeAlert.show(context,
                        title: 'Success',
                        description: "Sign out was successful",
                        backgroundColor: Config.accentColor,
                        duration: 3,
                        icon: Icons.info_outline,
                        gravity: EdgeAlert.bottom);
                  });
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
          child: Column(children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(24),
                      splashColor: Config.accentColor.withOpacity(0.2),
                      onTap: (){},
                      child: const ListTile(
                          title: Text("Title"),
                          subtitle: Text("Subtitle"),
                          leading: CircleAvatar(
                            child: Image(
                              image: AssetImage('icons/ic_google_pixel.png'),
                            ),
                          ),
                        ),
                      ));
            }),
      ])),
    );
  }

  openDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Edit User Details"),
            content: ListView(
              shrinkWrap: true,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(hintText: "Enter Name"),
                ),
                TextField(
                  controller: _genderController,
                  decoration: const InputDecoration(hintText: "Enter Gender"),
                ),
                TextField(
                  controller: _scoreController,
                  decoration: const InputDecoration(hintText: "Enter Score"),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(onPressed: () {}, child: const Text("Submit")),
            ],
          );
        });
  }
}
