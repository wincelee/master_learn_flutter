import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/screens/card_views.dart';
import 'package:master_learn/screens/fetch_lists_grids.dart';
import 'package:master_learn/screens/logins.dart';
import 'package:master_learn/screens/snack_bars.dart';

// Tutorial link [https://www.thirdrocktechkno.com/blog/how-to-implement-navigation-drawer-in-flutter/]

Future main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['fonts'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String startPage = "snackBars";

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Master Learn With Navigation',
        theme: ThemeData(
          primarySwatch: Config.createMaterialColor(Colors.green),
        ),
        home: Builder(builder: (BuildContext context) {
          if (Config().equalsIgnoreCase(startPage, "logins")) {
            return const Logins();
          } else if (Config().equalsIgnoreCase(startPage, "cardViews")) {
            return const CardViews();
          }else if (Config().equalsIgnoreCase(startPage, "snackBars")) {
            return const SnackBars();
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
