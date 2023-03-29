import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_learn/classes/config.dart';
import 'package:master_learn/my_navigation_drawer.dart';

class SnackBars extends StatefulWidget {
  const SnackBars({Key? key}) : super(key: key);

  @override
  _SnackBarsState createState() => _SnackBarsState();
}

class _SnackBarsState extends State<SnackBars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4c4c00),
          title: const Text("SnackBars"),
        ),
        drawer: const MyNavigationDrawer(),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Tapped'),
                      ));
                    },
                    child: const Text(
                      "Normal Simple SnackBar",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Showing SnackBar Voila'),
                                margin: EdgeInsets.all(15),
                                behavior: SnackBarBehavior.floating));
                      },
                      child: const Text(
                        "SnackBar with Margin(Must include floating behavior) "
                        "\n -Margin set to 15",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              elevation: 10,
                              content: Text('Showing SnackBar Voila'),
                              margin: EdgeInsets.all(15),
                              behavior: SnackBarBehavior.floating),
                        );
                      },
                      child: const Text(
                        "SnackBar with Elevation with Margin(Must include floating behavior)"
                        "\n -Elevation set to 10 \n -Margin set to 15",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Showing SnackBar Voila'),
                          margin: EdgeInsets.all(15),
                          behavior: SnackBarBehavior.floating,
                          padding: EdgeInsets.all(30),
                        ));
                      },
                      child: const Text(
                        "SnackBar with Margin(Must include floating behavior) With Padding "
                        "\n -Margin set to 15 \n -Padding Set to 30",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Showing SnackBar Voila'),
                          margin: EdgeInsets.all(15),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ));
                      },
                      child: const Text(
                        "SnackBar with Margin(Must include floating behavior) With Shape "
                        "\n -Margin set to 15 \n -Shape of RoundedRectangleBorder with circular radius of 20",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Showing SnackBar Voila'),
                          behavior: SnackBarBehavior.floating,
                          width: 200,
                        ));
                      },
                      child: const Text(
                        "SnackBar With Width(You Must Remove Margin When Using Width) "
                        "\n -Width set to 200",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Showing SnackBar Voila'),
                          margin: EdgeInsets.all(15),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.deepOrange,
                        ));
                      },
                      child: const Text(
                        "SnackBar with Margin(Must include floating behavior) With BackGround Color "
                        "\n -Margin set to 15 \n -Background color of deepOrange",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Showing SnackBar Voila'),
                                margin: EdgeInsets.all(15),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(milliseconds: 1000)));
                      },
                      child: const Text(
                        "SnackBar with Margin(Must include floating behavior) With Duration"
                        "\n -Margin set to 15 \n -Duration of 1000 Milliseconds",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Showing SnackBar Voila'),
                          margin: const EdgeInsets.all(15),
                          behavior: SnackBarBehavior.floating,
                          action: SnackBarAction(
                            label: 'Show Cupertino Dialog',
                            onPressed: () {
                              showCupertinoDialog<void>(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  title: const Text("Log Out ?"),
                                  content: const Text(
                                      'Are you sure you want to log out ?'),
                                  actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      child: const Text('Cancel'),
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: const Text('Log Out'),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ));
                      },
                      child: const Text(
                        "SnackBar with Margin(Must include floating behavior) With Action"
                        "\n -Margin set to 15 \n -Action to show dialog",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Showing SnackBar Voila'),
                          margin: const EdgeInsets.all(15),
                          behavior: SnackBarBehavior.floating,
                          action: SnackBarAction(
                            label: 'Show Cupertino Dialog',
                            onPressed: () {
                              showCupertinoDialog<void>(
                                context: context,
                                builder: (BuildContext context) =>
                                    CupertinoAlertDialog(
                                  content: const Text(
                                      'Are you sure you want to delete ?'),
                                  actions: <CupertinoDialogAction>[
                                    CupertinoDialogAction(
                                      child: const Text('Yes'),
                                      isDestructiveAction: true,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: const Text('No'),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
                            textColor: Colors.amber,
                          ),
                        ));
                      },
                      child: const Text(
                        "SnackBar with Margin(Must include floating behavior) With Amber Action Text Color"
                        "\n -Margin set to 15 \n -Action to show dialog",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            Config.buildSnackBar(
                                "Showing snackbar from config",
                                5,
                                const EdgeInsets.all(20),
                                const EdgeInsets.all(15),
                                Colors.deepOrange,
                                const Duration(milliseconds: 5000)));
                      },
                      child: const Text(
                        "SnackBar with margin, behavior, padding, background color apart from action using custom made snackbar widget",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )),
              ],
            ),
          )),
        ));
  }
}
