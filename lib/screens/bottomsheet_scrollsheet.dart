import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/navigation_drawer.dart';

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

  String? dropDownFormFieldSelectedValue;
  bool enableDropDownFormFieldLabelText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4c4c00),
        title: Text(widget.title),
      ),
      drawer: const NavigationDrawer(),
      body: SingleChildScrollView(
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
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
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
                      // transitionAnimationController: ,
                      builder: (context) {
                        // use StatefulBuilder to enable updating of state in bottom sheet
                        return StatefulBuilder(builder: (context, setState) {
                          return Container(
                              // Enable keyboard to appear below TextFormField
                              padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom),
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
                                          bottom: 5, top: 5, left: 5, right: 5),
                                      padding: const EdgeInsets.only(
                                          bottom: 5, top: 5, left: 5, right: 5),
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
                                                          left: 10, right: 5)),
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
                                                      onChangedValue.toString();
                                                  enableDropDownFormFieldLabelText =
                                                      true;
                                                });
                                              },
                                              items: itemList
                                                  .map((selectedValue) =>
                                                      DropdownMenuItem(
                                                          child: Text(
                                                              selectedValue),
                                                          value: selectedValue))
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
                        onPressed: () {
                          showBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  children: [
                                    const ListTile(
                                      leading: Icon(Icons.ac_unit),
                                      title: Text("Title 1"),
                                    ),
                                    // Add keyboard padding
                                  ],
                                );
                              });
                        },
                        child: const Text("Persistent Bottom Sheet")))),
            Center(
                child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("DraggableScrollableSheet"),
                    ))),
          ],
        ),
      ),
      // bottomSheet: ,
    );
  }
}
