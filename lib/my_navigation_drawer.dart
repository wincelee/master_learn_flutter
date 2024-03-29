import 'package:flutter/material.dart';
import 'package:master_learn/screens/bottomsheet_scrollsheet.dart';
import 'package:master_learn/screens/card_views.dart';
import 'package:master_learn/screens/cupertino_screen.dart';
import 'package:master_learn/screens/drop_down_spinners.dart';
import 'package:master_learn/screens/fetch_lists_grids.dart';
import 'package:master_learn/screens/logins.dart';
import 'package:master_learn/screens/options_menu.dart';
import 'package:master_learn/screens/snack_bars.dart';
import 'package:master_learn/screens/tab_bars_screen.dart';
import 'package:master_learn/widgets/create_drawer_body_item.dart';
import 'package:master_learn/widgets/create_drawer_header.dart';

import 'screens/banners_screen.dart';
import 'screens/firebase_operations.dart';
import 'widgets/image_icon_drawer_body_item.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
              icon: Icons.list,
              text: "Fetch Lists Grids",
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const FetchListsGrids()))),
          createDrawerBodyItem(
              icon: Icons.login,
              text: 'Logins',
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Logins()))),
          createDrawerBodyItem(
              icon: Icons.check_box_outline_blank,
              text: 'Card Views',
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const CardViews()))),
          createDrawerBodyItem(
              icon: Icons.space_bar_rounded,
              text: 'SnackBars',
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const SnackBars()))),
          createDrawerBodyItem(
              icon: Icons.phone_iphone,
              text: 'Cupertino',
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const CupertinoScreen()))),
          createDrawerBodyItem(
              icon: Icons.arrow_drop_down_circle_rounded,
              text: 'Drop Down Spinners',
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const DropDownSpinners(
                            title: "Drop Down Spinners",
                          )))),
          createDrawerBodyItem(
              icon: Icons.border_bottom_outlined,
              text: 'BottomSheet/ScrollSheet',
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const BottomSheetScrollSheet(
                            title: "BottomSheet/ScrollSheet",
                          )))),
          createDrawerBodyItem(
              icon: Icons.table_chart,
              text: 'Tab Bars',
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const TabBarsScreen(
                            title: "Tab Bars",
                          )))),
          createDrawerBodyItem(
              icon: Icons.more_vert_rounded,
              text: 'Options Menu',
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const OptionsMenu(
                            title: "Options Menu",
                          )))),
          imageIconDrawerBodyItem(
              imageAssetPath: "icons/ic_banner.png",
              text: 'Banners Screen',
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => const BannersScreen(
                            title: "Banners Screen",
                          )))),
          imageIconDrawerBodyItem(
              imageAssetPath: "icons/ic_firebase.png",
              text: 'Firebase Operations',
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const FirebaseOperations(
                            appBarTitle: "Firebase Operations",
                          )))),
          const Divider(),
          createDrawerBodyItem(
              icon: Icons.notifications_active, text: 'Notifications'),
          createDrawerBodyItem(icon: Icons.contact_phone, text: 'Contact Info'),
          ListTile(
            title: const Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
