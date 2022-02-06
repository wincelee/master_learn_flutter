import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/screens/card_views.dart';
import 'package:master_learn/screens/cupertino_screen.dart';
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
  final String startPage = "cardViews";
  final bool isMaterialApp = true;

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration.zero, () => appSelector(context));

    if (isMaterialApp) {
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
            } else if (Config().equalsIgnoreCase(startPage, "snackBars")) {
              return const SnackBars();
            }
            return const FetchListsGrids();
          }));
    }

    return const CupertinoApp(
        title: 'Master Learn With Navigation', home: CupertinoScreen());
  }

  void appSelector(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        content: const Text('Choose Between Cupertino and Material ?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            child: const Text('Cupertino'),
            onPressed: () {
              // return CupertinoApp
            },
          ),
          CupertinoDialogAction(
            child: const Text('Material'),
            onPressed: () {
              // return MaterialApp
            },
          ),
        ],
      ),
    );
  }
}
