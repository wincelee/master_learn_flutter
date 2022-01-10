import 'package:flutter/material.dart';
import 'package:master_learn/routes/screen_routes.dart';
import 'package:master_learn/screens/contacts.dart';
import 'package:master_learn/screens/fetch_lists.dart';
import 'package:master_learn/screens/home.dart';

// Tutorial link [https://www.thirdrocktechkno.com/blog/how-to-implement-navigation-drawer-in-flutter/]
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Master Learn With Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FetchList()
     /* routes:  {
        ScreenRoutes.homeScreen: (context) => const Home(),
        ScreenRoutes.contactsScreen: (context) => const Contacts(),
      },*/
    );
  }
}
