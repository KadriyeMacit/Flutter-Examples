import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../bottom_navigation_tab.dart';

class CupertinoBottomNavigationScaffold extends StatelessWidget {
  const CupertinoBottomNavigationScaffold({
    required this.navigationBarItems,
    required this.onItemSelected,
    required this.selectedIndex,
    Key? key,
  });

  final List<BottomNavigationTab> navigationBarItems;

  final ValueChanged<int> onItemSelected;

  final int selectedIndex;

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
        controller: CupertinoTabController(initialIndex: selectedIndex),
        tabBar: CupertinoTabBar(
          items: navigationBarItems
              .map(
                (item) => item.bottomNavigationBarItem,
              )
              .toList(),
          onTap: onItemSelected,
        ),
        tabBuilder: (context, index) {
          final barItem = navigationBarItems[index];
          return CupertinoTabView(
            navigatorKey: barItem.navigatorKey,
            onGenerateRoute: (settings) => CupertinoPageRoute(
              settings: settings,
              builder: barItem.initialPageBuilder,
            ),
          );
        },
      );
}
