import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_bottom_nav/custom/scaffolds/adaptive_bottom_navigation_scaffold.dart';
import 'package:instagram_bottom_nav/custom/app_flow.dart';
import 'package:instagram_bottom_nav/custom/bottom_navigation_tab.dart';

import 'views/indexed_page.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<AppFlow> appFlows = [
    AppFlow(
        title: 'Home',
        iconData: Icons.home,
        navigatorKey: GlobalKey<NavigatorState>(),
        pageIndex: 1),
    AppFlow(
        title: 'Profile',
        iconData: Icons.person,
        navigatorKey: GlobalKey<NavigatorState>(),
        pageIndex: 2)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AdaptiveBottomNavigationScaffold(
        navigationBarItems: appFlows
            .map(
              (flow) => BottomNavigationTab(
                bottomNavigationBarItem: BottomNavigationBarItem(
                  label: flow.title,
                  icon: Icon(flow.iconData),
                ),
                navigatorKey: flow.navigatorKey,
                initialPageBuilder: (context) => IndexedPage(
                  index: flow.pageIndex,
                  backgroundColor: Colors.white,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
