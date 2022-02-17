import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/navigation_drawer.dart';

class DropDownSpinners extends StatefulWidget {
  final String title;

  const DropDownSpinners({Key? key, required this.title}) : super(key: key);

  @override
  _DropDownSpinnersState createState() => _DropDownSpinnersState();
}

class _DropDownSpinnersState extends State<DropDownSpinners> {
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

  String? selectedValue;

  bool enableDisableUnderline = true;
  bool enableDisableDecoration = false;
  bool enableDisableBorderRadius = false;

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
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(5),
              child: Card(
                  child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: const Center(
                        child:
                            Text("Drop Down With HardCoded Text String List",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                      )),
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Enable/DisableUnderLine"),
                          Switch(
                            value: enableDisableUnderline,
                            onChanged: (bool value) {
                              setState(() {
                                enableDisableUnderline = value;
                                enableDisableDecoration = false;
                                enableDisableBorderRadius = false;
                              });
                            },
                          ),
                        ],
                      )),
                  Visibility(
                      visible: !enableDisableUnderline,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Enable/DisableDecoration"),
                          Switch(
                            value: enableDisableDecoration,
                            onChanged: (bool value) {
                              setState(() {
                                enableDisableDecoration = value;
                              });
                            },
                          ),
                        ],
                      )),),
                  Visibility(
                    visible: enableDisableDecoration,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Enable/DisableBorderRadius"),
                          Switch(
                            value: enableDisableBorderRadius,
                            onChanged: (bool value) {
                              setState(() {
                                enableDisableBorderRadius = value;
                              });
                            },
                          ),
                        ],
                      ),),),
                  Container(
                    width: double.infinity,
                    margin:
                        const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: enableDisableDecoration
                        ? BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: enableDisableBorderRadius ? BorderRadius.circular(15): null)
                        : null,
                    child: Center(
                        child: DropdownButton(
                      hint: const Text("Select Car"),
                      // you can add drop down color
                      dropdownColor: Colors.grey[100],
                      // set up your end icon here
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                        color: Config.primaryColor,
                      ),
                      iconSize: 30,
                      underline: !enableDisableUnderline ? const SizedBox() : null,
                      isExpanded: true,
                      style: const TextStyle(color: Colors.black, fontSize: 15),
                      value: selectedValue,
                      onChanged: (onChangedValue) {
                        setState(() {
                          selectedValue = onChangedValue.toString();
                        });
                      },
                      items: itemList
                          .map((selectedValue) => DropdownMenuItem(
                              child: Text(selectedValue), value: selectedValue))
                          .toList(),
                    )),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                    child: selectedValue != null ? Center(child: Text("Selected Car Is: $selectedValue")) : null)
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
