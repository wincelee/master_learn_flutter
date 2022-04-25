import 'package:flutter/material.dart';
import 'package:master_learn/classes/menu_item.dart';

class OptionsMenuWithIcons extends StatefulWidget {
  final String title;

  const OptionsMenuWithIcons({Key? key, required this.title}) : super(key: key);

  @override
  State<OptionsMenuWithIcons> createState() => _OptionsMenuWithIconsState();
}

class _OptionsMenuWithIconsState extends State<OptionsMenuWithIcons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton<MenuItem>(
              onSelected: (item) {},
              itemBuilder: (context) => [
                    ...[
                      const MenuItem(text: "Save", icon: Icons.save_rounded),
                      const MenuItem(text: "Share", icon: Icons.share_rounded)
                    ]
                        .map<PopupMenuItem<MenuItem>>(
                            (menuItem) => PopupMenuItem(
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                  Flexible(child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                    menuItem.icon,
                                    color: Colors.black,
                                    size: 20,
                                  ))),
                                  Flexible(child: Text(menuItem.text))
                                ])))
                        .toList()
                  ])
        ],
      ),
      body: Center(
        child: Image.asset("images/ic_options_menu_with_icon.jpg"),
      ),
    );
  }
}
