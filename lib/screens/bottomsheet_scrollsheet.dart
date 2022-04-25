import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:master_learn/bottom_sheet_screens/my_sliding_up_panel.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/navigation_drawer.dart';
import 'package:master_learn/widgets/my_widgets/my_custom_card_widget.dart';

class BottomSheetScrollSheet extends StatefulWidget {
  final String title;

  const BottomSheetScrollSheet({Key? key, required this.title})
      : super(key: key);

  @override
  _BottomSheetScrollSheetState createState() => _BottomSheetScrollSheetState();
}

class _BottomSheetScrollSheetState extends State<BottomSheetScrollSheet> {
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

  String? dropDownFormFieldSelectedValue;
  bool enableDropDownFormFieldLabelText = false;

  @override
  void initState() {
    super.initState();

    populateItemsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4c4c00),
        title: Text(widget.title),
      ),
      drawer: const NavigationDrawer(),
      body: Stack(fit: StackFit.expand, children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: ElevatedButton(
                    onPressed: () => showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25))),
                        elevation: 5,
                        // enable disable scroll
                        // enable this together with padding of
                        // MediaQuery viewInsets.bottom and SingleChildScrollView to enable keyboard to
                        // appear bottom when inputting text to TextFormField in bottom sheet
                        isScrollControlled: true,
                        // enable disable dismissing when
                        // clicking outside bottom sheet
                        isDismissible: true,
                        backgroundColor: Colors.white,
                        // Color behind bottom sheet
                        // barrierColor: Colors.transparent,
                        //  transitionAnimationController: ,
                        builder: (context) {
                          // use StatefulBuilder to enable updating of state in bottom sheet
                          return StatefulBuilder(builder: (context, setState) {
                            return Container(
                                // Enable keyboard to appear below TextFormField
                                padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom),
                                child:
                                    // Enable SingleChildScrollView to prevent pixel overflow when
                                    // keyboard is enabled to appear below bottom sheet
                                    SingleChildScrollView(
                                        child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const ListTile(
                                      leading: Icon(Icons.business),
                                      title: Text("House"),
                                      subtitle: Text("Business House"),
                                    ),
                                    const ListTile(
                                      leading: Icon(Icons.car_rental),
                                      title: Text("Car"),
                                      subtitle: Text("Rental Car"),
                                    ),
                                    const ListTile(
                                      leading: Icon(Icons.laptop_chromebook),
                                      title: Text("Laptop"),
                                      subtitle: Text("Chrome Book"),
                                    ),
                                    const ListTile(
                                      leading: Icon(Icons.keyboard),
                                      title: Text("Keyboard"),
                                      subtitle: Text("Razor Keyboard"),
                                    ),
                                    Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(
                                            bottom: 5,
                                            top: 5,
                                            left: 5,
                                            right: 5),
                                        padding: const EdgeInsets.only(
                                            bottom: 5,
                                            top: 5,
                                            left: 5,
                                            right: 5),
                                        child: TextFormField(
                                          cursorHeight: 20,
                                          // You cant have an initial value and a controller at the same time
                                          // there can only be one
                                          // initialValue: "+254",
                                          decoration: const InputDecoration(
                                              labelText: "Enter Keyword",
                                              border: OutlineInputBorder(),
                                              contentPadding: EdgeInsets.only(
                                                  left: 10, right: 5)),
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                        )),
                                    Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                          bottom: 5, top: 5, left: 5, right: 5),
                                      padding: const EdgeInsets.only(
                                          bottom: 5, top: 5, left: 5, right: 5),
                                      child: Center(
                                          // set drop down item selector color
                                          // hold down on the drop down to experience the effect
                                          child: Theme(
                                              data: ThemeData(
                                                  highlightColor:
                                                      Config.accentColor),
                                              child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                    labelText:
                                                        enableDropDownFormFieldLabelText
                                                            ? "Select Car"
                                                            : null,
                                                    border:
                                                        const OutlineInputBorder(),
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            right: 5)),
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
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                                value:
                                                    dropDownFormFieldSelectedValue,
                                                onChanged: (onChangedValue) {
                                                  setState(() {
                                                    dropDownFormFieldSelectedValue =
                                                        onChangedValue
                                                            .toString();
                                                    enableDropDownFormFieldLabelText =
                                                        true;
                                                  });
                                                },
                                                items: itemList
                                                    .map((selectedValue) =>
                                                        DropdownMenuItem(
                                                            child: Text(
                                                                selectedValue),
                                                            value:
                                                                selectedValue))
                                                    .toList(),
                                              ))),
                                    ),
                                    Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 10,
                                            bottom: 10),
                                        child: dropDownFormFieldSelectedValue !=
                                                null
                                            ? Center(
                                                child: Text(
                                                    "Selected Car Is: $dropDownFormFieldSelectedValue"))
                                            : null),
                                  ],
                                )));
                          });
                        }),
                    child: const Text("Modal BottomSheet")),
              )),
              Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: ElevatedButton(
                          onPressed: () =>
                              Scaffold.of(context).showBottomSheet<void>(
                                (BuildContext context) {
                                  return StatefulBuilder(
                                      builder: (context, setState) {
                                    return Container(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom),
                                      color: Colors.amber,
                                      child: Center(
                                        child: Text(
                                            "Voila showing persistent bottom sheet hahaha"),
                                      ),
                                    );
                                  });
                                },
                              ),
                          child: const Text("Persistent Bottom Sheet")))),
              Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                const MySlidingUpPanel(appBarTitle: "My Sliding Up Panel"))),
                        child: const Text("My Sliding Up Panel"),
                      ))),
            ],
          ),
        ),
        DraggableScrollableSheet(
          // Height where the draggable bottom sheet will show screen launch
          // 0.1 is 10% of the height
          initialChildSize: 0.1,
            // Minimum height where the draggable scrollable sheet will reach on dragging down
            // 0.1 is 10% of the height
            minChildSize: 0.1,
            // Maximum height where the draggable scrollable sheet will reach on dragging up
            // 0.8 is 80% of the height
            maxChildSize: 0.5,
            builder: (context, scrollController) => ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.white,
                  child: Builder(
                    builder: (BuildContext context) {
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
                            controller: scrollController,
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
                ))),
      ]),
      // bottomSheet: ,
    );
  }
}
