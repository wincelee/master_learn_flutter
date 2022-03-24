import 'package:flutter/material.dart';

class TabBarsOutsideAppBar extends StatefulWidget {
  final String appBarTitle;

  const TabBarsOutsideAppBar({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  State<TabBarsOutsideAppBar> createState() => _TabBarsOutsideAppBarState();
}

class _TabBarsOutsideAppBarState extends State<TabBarsOutsideAppBar>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.appBarTitle),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
              // Unselected Tab Text Color
              unselectedLabelColor: Colors.black,
              // Selected Tab Text Color
              labelColor: Colors.red,
              tabs: const [
                Tab(
                  text: 'This is Tab 1',
                ),
                Tab(
                  text: 'This is Tab 2',
                )
              ],
              controller: tabController,
              // Length of the tab underline
              // TabBarIndicatorSize.label - Tab underline size according to the size of the label text
              // TabBarIndicatorSize.tab - Tab underline size according to the size of the tab
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                children: const [
                  Text("You have clicked on tab 1"),
                  Text('You have clicked on tab 2')
                ],
                controller: tabController,
              ),
            ),
          ],
        ));
  }
}
