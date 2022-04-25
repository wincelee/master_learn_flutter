import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/widgets/my_widgets/my_custom_card_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MySlidingUpPanel extends StatefulWidget {
  final String appBarTitle;

  const MySlidingUpPanel({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  _MySlidingUpPanelState createState() => _MySlidingUpPanelState();
}

class _MySlidingUpPanelState extends State<MySlidingUpPanel> {
  String? dropDownFormFieldSelectedValue;
  bool enableDropDownFormFieldLabelText = false;

  List<String> itemList = [
    "Bugatti",
    "BMW",
    "Mercedes",
    "Audi",
    "Volvo",
    "Toyota",
    "Nissan",
    "Renault",
    "Mazda",
    "Subaru",
    "Hyundai"
  ];

  List<HashMap<String, dynamic>>? itemsMapList;

  Future populateItemsList() async {
    final itemsMapList = await AsyncFutures.fetchLists(
        "https://api.json-generator.com/templates/ueOoUwh5r44G/data", "");

    setState(() {
      this.itemsMapList = itemsMapList;
    });
  }

  @override
  void initState() {
    super.initState();

    populateItemsList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle),
      ),
      body: SlidingUpPanel(
        minHeight: 50,
        maxHeight: 300,
        parallaxEnabled: true,
        parallaxOffset: .3,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        panel: Container(
                margin: const EdgeInsets.all(1),
                child: SingleChildScrollView(child: Column(
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.lightbulb),
                      title: Text("This is bulb"),
                      subtitle: Text("This is bulb subtitle"),
                    ),
                    Container(
                        width: double.infinity,
                        margin:
                        const EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 5),
                        padding:
                        const EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 5),
                        child: TextFormField(
                          cursorHeight: 20,
                          // You cant have an initial value and a controller at the same time
                          // there can only be one
                          // initialValue: "+254",
                          decoration: const InputDecoration(
                              labelText: "Enter Keyword Test Keyboard",
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.only(left: 10, right: 5)),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        )),
                    Container(
                      width: double.infinity,
                      margin:
                      const EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 5),
                      padding:
                      const EdgeInsets.only(bottom: 5, top: 5, left: 5, right: 5),
                      child: Center(
                        // set drop down item selector color
                        // hold down on the drop down to experience the effect
                          child: Theme(
                              data: ThemeData(highlightColor: Config.accentColor),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    labelText: enableDropDownFormFieldLabelText
                                        ? "Select Car"
                                        : null,
                                    border: const OutlineInputBorder(),
                                    contentPadding:
                                    const EdgeInsets.only(left: 10, right: 5)),
                                hint: const Text("Select Car"),
                                // you can add drop down color
                                dropdownColor: Colors.grey[100],
                                // set up your end icon here
                                icon: const Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: Config.accentColor,
                                ),
                                iconSize: 25,
                                isExpanded: true,
                                style:
                                const TextStyle(color: Colors.black, fontSize: 15),
                                value: dropDownFormFieldSelectedValue,
                                onChanged: (onChangedValue) {
                                  setState(() {
                                    dropDownFormFieldSelectedValue =
                                        onChangedValue.toString();
                                    enableDropDownFormFieldLabelText = true;
                                  });
                                },
                                items: itemList
                                    .map((selectedValue) => DropdownMenuItem(
                                    child: Text(selectedValue),
                                    value: selectedValue))
                                    .toList(),
                              ))),
                    ),
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: dropDownFormFieldSelectedValue != null
                            ? Center(
                            child: Text(
                                "Selected Car Is: $dropDownFormFieldSelectedValue"))
                            : null),
                  ],
                ))),
            /*Column(
              children: [Expanded(child:
                Builder(
                  builder: (BuildContext context) {
                    if (itemsMapList == null) {
                      return const Center(
                          child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.orange),
                        strokeWidth: 2.0,
                      ));
                    } else {
                      return RefreshIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.orangeAccent,
                        onRefresh: () async =>
                            setState(() => populateItemsList()),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: itemsMapList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return myCustomCardWidget(
                                  itemsMapList![index]["id"] ?? "",
                                  itemsMapList![index]["title"] ?? "",
                                  itemsMapList![index]["subTitle"] ?? '',
                                  itemsMapList![index]["imageUrl"] ??
                                      Config.nullNetworkImage);
                            }),
                      );
                    }
                  },
                )),]
            )*/
         /*SingleChildScrollView(child: SizedBox(
          child: Builder(
            builder: (BuildContext context){
              if (itemsMapList == null) {
                return const Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  strokeWidth: 2.0,
                ));
              } else {
                return RefreshIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.orangeAccent,
                  onRefresh: () async =>
                      setState(() => populateItemsList()),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: itemsMapList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return myCustomCardWidget(
                            itemsMapList![index]["id"] ?? "",
                            itemsMapList![index]["title"] ?? "",
                            itemsMapList![index]["subTitle"] ?? '',
                            itemsMapList![index]["imageUrl"] ??
                                Config.nullNetworkImage);
                      }),
                );
              }
            },
          ),
        ))*/
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FittedBox(
            child: Image.asset(
              //"images/neon_laser_lights.gif",
              "images/nav_header_background.jpg"
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
