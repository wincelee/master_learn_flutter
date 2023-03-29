import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:master_learn/classes/EdgeAlert.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/firebase_operations/database_manager/database_manager.dart';
import 'package:master_learn/firebase_operations/fetch_all_items_using_class_without_uid.dart';
import 'package:master_learn/firebase_operations/fetch_all_items_without_using_class_without_uid.dart';
import 'package:master_learn/firebase_operations/services/auth_service.dart';
import 'package:master_learn/firebase_operations/sign_in_using_email_and_password.dart';
import 'package:master_learn/my_navigation_drawer.dart';
import 'package:master_learn/widgets/marquee_widget.dart';
import 'package:master_learn/widgets/reusable_row.dart';
import 'package:shimmer/shimmer.dart';

class FirebaseDashBoard extends StatefulWidget {
  final String appBarTitle;

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

  List? _userProfilesList;

  late String _email = "";
  late String _uid = "";

  @override
  void initState() {
    super.initState();

    fetchUsersDataList();
    fetchUserDetails();
  }

  fetchUserDetails() async {
    dynamic _result = await _authService.userDetails();

    if (_result.runtimeType == FirebaseAuthException) {
      EdgeAlert.show(context,
          title: 'We encountered an error while fetching user details',
          description: _result.message,
          backgroundColor: Config.primaryColor,
          duration: 3,
          icon: Icons.info_outline,
          gravity: EdgeAlert.bottom);
    } else {
      setState(() {
        _email = _result.email;
        _uid = _result.uid;
      });
    }
  }

  fetchUsersDataList() async {
    dynamic result = await DatabaseManager().fetchUsersData();

    if (result.runtimeType == FirebaseAuthException) {
      EdgeAlert.show(context,
          title: 'Please try again',
          description: result.message,
          backgroundColor: Config.primaryColor,
          duration: 3,
          icon: Icons.info_outline,
          gravity: EdgeAlert.bottom);
    } else {
      _userProfilesList = result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SizedBox(
            child: MarqueeWidget(
              direction: Axis.horizontal,
              child: Text(widget.appBarTitle),
            ),
          ),
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
                          builder: (context) =>
                              const SignInUsingEmailAndPassword(
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
        drawer: const MyNavigationDrawer(),
        body: Column(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
              padding:
                  const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    _email.isEmpty
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const SizedBox(height: 30),
                                );
                              },
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: reusableRow(
                                "icons/ic_email.png", "Email", _email)),
                    _uid.isEmpty
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Card(
                                  elevation: 1.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const SizedBox(height: 30),
                                );
                              },
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: reusableRow("icons/ic_id.png", "Uid", _uid)),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FetchAllItemsUsingClassWithoutUid(
                                      appBarTitle: "FetchAllItemsWithoutUid")));
                    },
                    child: const Text("FetchAllItemsUsingClassWithoutUid"),
                  ),
                )),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const FetchAllItemsWithoutUsingClassWithoutUid(
                                    appBarTitle:
                                        "FetchAllItemsWithoutUsingClassWithoutUid")));
                  },
                  child: const Text("FetchAllItemsWithoutUsingClassWithoutUid"),
                ),
              ),
            )
            /*Expanded(child: Builder(builder: (BuildContext context) {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _userProfilesList!.length,
                  itemBuilder: (context, index) {
                    if (_userProfilesList == null) {
                      Config.loaderDialog(context);
                    }

                    return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          splashColor: Config.accentColor.withOpacity(0.2),
                          onTap: () {},
                          child: ListTile(
                            title: Text(
                                "Name: ${_userProfilesList![index]['name']}"),
                            subtitle: Text(
                                "Gender ${_userProfilesList![index]['gender']} \nScore: ${_userProfilesList![index]['score']}"),
                            leading: const CircleAvatar(
                              child: Image(
                                image: AssetImage('icons/ic_google_pixel.png'),
                              ),
                            ),
                          ),
                        ));
                  });
            })),*/
          ],
        ));
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
