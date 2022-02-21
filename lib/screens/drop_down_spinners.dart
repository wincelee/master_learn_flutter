import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:master_learn/classes/async_futures.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/classes/user.dart';
import 'package:master_learn/navigation_drawer.dart';
import 'package:master_learn/widgets/icon_progress_indicator.dart';

class DropDownSpinners extends StatefulWidget {
  final String title;

  const DropDownSpinners({Key? key, required this.title}) : super(key: key);

  @override
  _DropDownSpinnersState createState() => _DropDownSpinnersState();
}

class _DropDownSpinnersState extends State<DropDownSpinners> {
  List<User>? usersList;
  List<HashMap<String, dynamic>>? usersMapList;

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
  String? dropDownTextFormFieldLikeSelectedValue;
  String? dropDownFormFieldSelectedValue;
  String? customizableDropDownFormFieldSelectedValue;
  User? dropDownSelectedUser;
  HashMap<String, dynamic>? dropDownSelectedUserMap;

  bool enableDisableUnderline = true;
  bool enableDisableDecoration = false;
  bool enableDisableBorderRadius = false;

  bool enableDropDownFormFieldLabelText = false;
  bool enableCustomizableDropDownFormFieldLabelText = false;

  bool enableDropDownTextFormFieldLikeLabelText = false;
  bool enableDropDownUserLabelText = false;
  bool enableDropDownUserWithMapLabelText = false;

  bool enableCustomizableDropDownFormFieldOutlineInputBorder = true;
  bool enableCustomizableDropDownFormFieldOutlineInputBorderBorderRadius =
      false;

  bool enableCustomizableDropDownFormFieldFill = false;

  Future populateUsersList() async {
    final usersList = await AsyncFutures.fetchUsersListWithoutLoop();

    setState(() {
      this.usersList = usersList;
    });
  }

  Future populateUsersMapList() async {
    final usersMapList = await AsyncFutures.fetchListOfMaps(
        "https://api.json-generator.com/templates/Eh5AlPjYVv6C/data");

    setState(() {
      this.usersMapList = usersMapList;
    });
  }

  @override
  void initState() {
    super.initState();

    populateUsersList();

    populateUsersMapList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4c4c00),
          title: Text(widget.title),
        ),
        drawer: const NavigationDrawer(),
        body: Center(
          child: SingleChildScrollView(
              child: Builder(builder: (BuildContext context) {
            if (usersList == null) {
              return iconProgressIndicator();
            } else if (usersMapList == null) {
              return iconProgressIndicator();
            }

            return Column(
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
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: const Center(
                              child: Text(
                                "Drop Down With HardCoded Text String List",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
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
                              )),
                        ),
                        Visibility(
                          visible: enableDisableDecoration,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: enableDisableDecoration
                              ? BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 0.5),
                                  borderRadius: enableDisableBorderRadius
                                      ? BorderRadius.circular(15)
                                      : null)
                              : null,
                          child: Center(
                              // set drop down item selector color
                              // hold down on the drop down to experience the effect
                              child: Theme(
                                  data: ThemeData(
                                      highlightColor: Colors.orange[100]),
                                  child: DropdownButton(
                                    hint: const Text("Select Car"),
                                    // you can add drop down color
                                    dropdownColor: Colors.grey[100],
                                    // set up your end icon here
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Config.primaryColor,
                                    ),
                                    iconSize: 25,
                                    underline: !enableDisableUnderline
                                        ? const SizedBox()
                                        : null,
                                    isExpanded: true,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    value: selectedValue,
                                    onChanged: (onChangedValue) {
                                      setState(() {
                                        selectedValue =
                                            onChangedValue.toString();
                                      });
                                    },
                                    items: itemList
                                        .map((selectedValue) =>
                                            DropdownMenuItem(
                                                child: Text(selectedValue),
                                                value: selectedValue))
                                        .toList(),
                                  ))),
                        ),
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: selectedValue != null
                                ? Center(
                                    child:
                                        Text("Selected Car Is: $selectedValue"))
                                : null)
                      ],
                    ))),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: Card(
                        child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 5),
                            child: const Center(
                              child: Text(
                                "Drop Down With TextFormField Like Design",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText:
                                  enableDropDownTextFormFieldLikeLabelText
                                      ? "Select Car"
                                      : null,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              contentPadding:
                                  const EdgeInsets.only(left: 10, right: 5),
                            ),
                            child: ButtonTheme(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                child: Theme(
                                  data: ThemeData(
                                      highlightColor: Colors.orange[100]),
                                  child: DropdownButton(
                                    hint: const Text("Select Car"),
                                    isExpanded: true,
                                    value:
                                        dropDownTextFormFieldLikeSelectedValue,
                                    // drop down elevation dont remove from 16
                                    elevation: 16,
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Config.primaryColor,
                                    ),
                                    iconSize: 25,
                                    underline: const SizedBox(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        dropDownTextFormFieldLikeSelectedValue =
                                            newValue.toString();
                                        enableDropDownTextFormFieldLikeLabelText =
                                            true;
                                      });
                                    },
                                    items: itemList
                                        .map((selectedValue) =>
                                            DropdownMenuItem(
                                                child: Text(selectedValue),
                                                value: selectedValue))
                                        .toList(),
                                  ),
                                )),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: dropDownTextFormFieldLikeSelectedValue !=
                                    null
                                ? Center(
                                    child: Text(
                                        "Selected Car Is: $dropDownTextFormFieldLikeSelectedValue"))
                                : null)
                      ],
                    ))),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: Card(
                        child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 5),
                            child: const Center(
                              child: Text(
                                "Drop Down With Fetched Users Using List",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: enableDropDownUserLabelText
                                  ? "Select Text"
                                  : null,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              contentPadding:
                                  const EdgeInsets.only(left: 10, right: 5),
                            ),
                            child: ButtonTheme(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                child: Theme(
                                  data: ThemeData(
                                      highlightColor: Colors.orange[100]),
                                  child: DropdownButton<User>(
                                    hint: const Text("Select Text"),
                                    isExpanded: true,
                                    value: dropDownSelectedUser,
                                    // drop down elevation dont remove from 16
                                    elevation: 16,
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Config.primaryColor,
                                    ),
                                    iconSize: 25,
                                    underline: const SizedBox(),
                                    onChanged: (user) {
                                      setState(() {
                                        dropDownSelectedUser = user;
                                        enableDropDownUserLabelText = true;
                                      });
                                    },
                                    items: usersList
                                        ?.map<DropdownMenuItem<User>>((user) =>
                                            DropdownMenuItem(
                                                child: Text("${user.name}"),
                                                value: user))
                                        .toList(),
                                  ),
                                )),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: dropDownSelectedUser != null
                                ? Center(
                                    child: Text(
                                        "Selected Text Is: ${dropDownSelectedUser?.name} \n"
                                        "Selected Index Is ${dropDownSelectedUser?.index}"))
                                : null)
                      ],
                    ))),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    child: Card(
                        child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 5),
                            child: const Center(
                              child: Text(
                                "Drop Down With Fetched Users Using Map",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: enableDropDownUserWithMapLabelText
                                  ? "Select Text"
                                  : null,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              contentPadding:
                                  const EdgeInsets.only(left: 10, right: 5),
                            ),
                            child: ButtonTheme(
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                child: Theme(
                                  data: ThemeData(
                                      highlightColor: Colors.orange[100]),
                                  child:
                                      DropdownButton<HashMap<String, dynamic>>(
                                    hint: const Text("Select Text"),
                                    isExpanded: true,
                                    value: dropDownSelectedUserMap,
                                    // drop down elevation dont remove from 16
                                    elevation: 16,
                                    icon: const Icon(
                                      Icons.arrow_drop_down_sharp,
                                      color: Config.primaryColor,
                                    ),
                                    iconSize: 25,
                                    underline: const SizedBox(),
                                    onChanged: (hashMap) {
                                      setState(() {
                                        dropDownSelectedUserMap = hashMap;
                                        enableDropDownUserWithMapLabelText =
                                            true;
                                      });
                                    },
                                    items: usersMapList
                                        ?.map<
                                                DropdownMenuItem<
                                                    HashMap<String, dynamic>>>(
                                            (hashMap) => DropdownMenuItem(
                                                child: Text(hashMap["name"]),
                                                value: hashMap))
                                        .toList(),
                                  ),
                                )),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: dropDownSelectedUserMap != null
                                ? Center(
                                    child: Text(
                                        "Selected Text Is: ${dropDownSelectedUserMap!["name"] ?? ""} \n"
                                        "Selected Index Is ${dropDownSelectedUserMap?["index"] ?? ""}"))
                                : null)
                      ],
                    ))),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 5, right: 5),
                    child: Card(
                        child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: const Center(
                              child: Text(
                                "DropDownFormField With HardCoded Text String List",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Enable/DisabledOutlineInputBorder"),
                                Switch(
                                  value:
                                      enableCustomizableDropDownFormFieldOutlineInputBorder,
                                  onChanged: (bool value) {
                                    setState(() {
                                      enableCustomizableDropDownFormFieldOutlineInputBorder =
                                          value;
                                      //enableDisableDecoration = false;
                                      //enableDisableBorderRadius = false;
                                    });
                                  },
                                ),
                              ],
                            )),
                        Visibility(
                            visible:
                                enableCustomizableDropDownFormFieldOutlineInputBorder,
                            child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Flexible(
                                        child: Text(
                                      "Enable/DisabledOutlineInputBorderBorderRadius",
                                      textAlign: TextAlign.center,
                                    )),
                                    Flexible(child: Switch(
                                      value:
                                          enableCustomizableDropDownFormFieldOutlineInputBorderBorderRadius,
                                      onChanged: (bool value) {
                                        setState(() {
                                          enableCustomizableDropDownFormFieldOutlineInputBorderBorderRadius =
                                              value;
                                        });
                                      },
                                    )),
                                  ],
                                ))),
                        Container(
                            width: double.infinity,
                            padding:
                            const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Flexible(
                                    child: Text(
                                      "Enable/Disable Fill Color",
                                      textAlign: TextAlign.center,
                                    )),
                                Flexible(child: Switch(
                                  value:
                                  enableCustomizableDropDownFormFieldFill,
                                  onChanged: (bool value) {
                                    setState(() {
                                      enableCustomizableDropDownFormFieldFill =
                                          value;
                                    });
                                  },
                                )),
                              ],
                            )),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Center(
                              // set drop down item selector color
                              // hold down on the drop down to experience the effect
                              child: Theme(
                                  data: ThemeData(
                                      highlightColor: Config.accentColor),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        filled: enableCustomizableDropDownFormFieldFill,
                                        fillColor: enableCustomizableDropDownFormFieldFill ? Colors.grey[50]: null,
                                        labelText:
                                            enableDropDownFormFieldLabelText
                                                ? "Select Car"
                                                : null,
                                        border:
                                            enableCustomizableDropDownFormFieldOutlineInputBorder
                                                ? OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(15))
                                                : null,
                                        contentPadding: const EdgeInsets.only(
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
                                        color: Colors.black, fontSize: 15),
                                    value:
                                        customizableDropDownFormFieldSelectedValue,
                                    onChanged: (onChangedValue) {
                                      setState(() {
                                        customizableDropDownFormFieldSelectedValue =
                                            onChangedValue.toString();
                                        enableDropDownFormFieldLabelText = true;
                                      });
                                    },
                                    items: itemList
                                        .map((selectedValue) =>
                                            DropdownMenuItem(
                                                child: Text(selectedValue),
                                                value: selectedValue))
                                        .toList(),
                                  ))),
                        ),
                        Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: customizableDropDownFormFieldSelectedValue !=
                                    null
                                ? Center(
                                    child: Text(
                                        "Selected Car Is: $customizableDropDownFormFieldSelectedValue"))
                                : null)
                      ],
                    ))),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 5, right: 5),
                    child: Card(
                        child: Column(
                      children: [
                        Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: const Center(
                              child: Text(
                                "DropDownFormField With HardCoded Text String List",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Center(
                              // set drop down item selector color
                              // hold down on the drop down to experience the effect
                              child: Theme(
                                  data: ThemeData(
                                      highlightColor: Config.accentColor),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        labelText:
                                            enableDropDownFormFieldLabelText
                                                ? "Select Car"
                                                : null,
                                        border: const OutlineInputBorder(),
                                        contentPadding: const EdgeInsets.only(
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
                                        color: Colors.black, fontSize: 15),
                                    value: dropDownFormFieldSelectedValue,
                                    onChanged: (onChangedValue) {
                                      setState(() {
                                        dropDownFormFieldSelectedValue =
                                            onChangedValue.toString();
                                        enableDropDownFormFieldLabelText = true;
                                      });
                                    },
                                    items: itemList
                                        .map((selectedValue) =>
                                            DropdownMenuItem(
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
                                : null)
                      ],
                    )))
              ],
            );
          })),
        ));
  }
}
