import 'package:flutter/material.dart';
import 'package:master_learn/screens/contacts.dart';
import 'package:master_learn/screens/fetch_lists_grids.dart';
import 'package:master_learn/screens/home.dart';
import 'package:master_learn/screens/logins.dart';
import 'package:master_learn/widgets/create_drawer_body_item.dart';
import 'package:master_learn/widgets/create_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

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
           onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(
             builder: (BuildContext context) => const FetchListsGrids()
           ))
         ),
          createDrawerBodyItem(
              icon: Icons.login,
              text: 'Logins',
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Logins()))),
          createDrawerBodyItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Home()))),
          createDrawerBodyItem(
              icon: Icons.account_circle,
              text: 'Profile',
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Contacts()))),
          createDrawerBodyItem(icon: Icons.event_note, text: 'Events'),
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
