import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/screens/bottomsheet_scrollsheet.dart';
import 'package:master_learn/screens/card_views.dart';
import 'package:master_learn/screens/cupertino_screen.dart';
import 'package:master_learn/screens/drop_down_spinners.dart';
import 'package:master_learn/screens/fetch_lists_grids.dart';
import 'package:master_learn/screens/firestore_list.dart';
import 'package:master_learn/screens/logins.dart';
import 'package:master_learn/screens/options_menu.dart';
import 'package:master_learn/screens/snack_bars.dart';
import 'package:master_learn/screens/tab_bars_screen.dart';

import 'screens/banners_screen.dart';

// Tutorial link [https://www.thirdrocktechkno.com/blog/how-to-implement-navigation-drawer-in-flutter/]

Future main() async {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['fonts'], license);
  });

  // runApp(DevicePreview(
  //     tools: const [
  //       ...DevicePreview.defaultTools,
  //       DevicePreviewScreenshot(),
  //     ],
  //     enabled: !kReleaseMode, builder: (context) => const MyApp()));

  runApp(const MyApp());
}

Future addFlags() async {
  if (kDebugMode) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await FlutterWindowManager.addFlags(
          FlutterWindowManager.FLAG_TURN_SCREEN_ON);

      await FlutterWindowManager.addFlags(
          FlutterWindowManager.FLAG_DISMISS_KEYGUARD);

      await FlutterWindowManager.addFlags(
          FlutterWindowManager.FLAG_SHOW_WHEN_LOCKED);
    }
  }
}

class MyApp extends StatelessWidget {
  final String startPage = "optionsMenu";
  final bool isMaterialApp = true;

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Future.delayed(Duration.zero, () => appSelector(context));

    addFlags();

    if (isMaterialApp) {
      return MaterialApp(
          title: 'Master Learn With Navigation',
          debugShowCheckedModeBanner: false,
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
            } else if (Config().equalsIgnoreCase(startPage, "listsGrids")) {
              return const FetchListsGrids();
            } else if (Config().equalsIgnoreCase(startPage, "dropDowns")) {
              return const DropDownSpinners(title: "Drop Down Spinners");
            } else if (Config().equalsIgnoreCase(startPage, "bottomSheet")) {
              return const BottomSheetScrollSheet(
                  title: "BottomSheet/ScrollSheet");
            } else if (Config().equalsIgnoreCase(startPage, "tabBars")) {
              return const TabBarsScreen(
                  title: "TabBars");
            }else if (Config().equalsIgnoreCase(startPage, "optionsMenu")) {
              return const OptionsMenu(
                  title: "OptionsMenu");
            }else if (Config().equalsIgnoreCase(startPage, "bannersScreen")) {
              return const BannersScreen(
                  title: "Banners Screen");
            }else if (Config().equalsIgnoreCase(startPage, "fireStoreList")) {
              return const FirestoreList(
                  appBarTitle: "FireStore List");
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
