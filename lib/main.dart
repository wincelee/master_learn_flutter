import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/screens/fetch_lists_grids.dart';
import 'package:master_learn/screens/logins.dart';

// Tutorial link [https://www.thirdrocktechkno.com/blog/how-to-implement-navigation-drawer-in-flutter/]

Future main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String startPage = "logins";

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Master Learn With Navigation',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(builder: (BuildContext context) {
          if (Config().equalsIgnoreCase(startPage, "logins")) {
            return const Logins();
          }

          return const FetchListsGrids();
        })
        /* routes:  {
        ScreenRoutes.homeScreen: (context) => const Home(),
        ScreenRoutes.contactsScreen: (context) => const Contacts(),
      },*/
        );
  }
}
