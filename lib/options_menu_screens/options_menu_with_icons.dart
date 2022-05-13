import 'package:flutter/material.dart';
import 'package:master_learn/classes/my_menu_items.dart';

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
          PopupMenuButton<MyMenuItems>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                    ...[
                      MyMenuItems.saveMenuItem,
                      MyMenuItems.shareMenuItem
                    ]
                        .map<PopupMenuItem<MyMenuItems>>(
                            (myMenuItems) => PopupMenuItem(
                              value: myMenuItems,
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                  Flexible(child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        myMenuItems.icon,
                                    color: Colors.black,
                                    size: 20,
                                  ))),
                                  Flexible(child: Text(myMenuItems.text))
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

  void onSelected(BuildContext context, MyMenuItems myMenuItems){
    switch(myMenuItems){
      case MyMenuItems.saveMenuItem:

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              elevation: 10,
              content: Text('Save Clicked'),
              margin: EdgeInsets.all(15),
              behavior: SnackBarBehavior.floating,
            duration: Duration(milliseconds: 500),),
        );
        break;

      case MyMenuItems.shareMenuItem:
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              elevation: 10,
              content: Text('Share Clicked'),
              margin: EdgeInsets.all(15),
              behavior: SnackBarBehavior.floating,
            duration: Duration(milliseconds: 500),
          ),
        );
        break;
    }
  }
}
