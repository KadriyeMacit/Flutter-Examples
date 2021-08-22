import 'dart:io';

import 'package:flutter/widgets.dart';

import '../bottom_navigation_tab.dart';
import 'cupertino_bottom_navigation_scaffold.dart';
import 'material_bottom_navigation_scaffold.dart';

class AdaptiveBottomNavigationScaffold extends StatefulWidget {
  const AdaptiveBottomNavigationScaffold({
    required this.navigationBarItems,
    Key? key,
  })  : assert(navigationBarItems != null),
        super(key: key);

  final List<BottomNavigationTab> navigationBarItems;

  @override
  _AdaptiveBottomNavigationScaffoldState createState() =>
      _AdaptiveBottomNavigationScaffoldState();
}

class _AdaptiveBottomNavigationScaffoldState
    extends State<AdaptiveBottomNavigationScaffold> {
  int _currentlySelectedIndex = 0;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => !await widget
            .navigationBarItems[_currentlySelectedIndex]
            .navigatorKey
            .currentState!
            .maybePop(),
        child: Platform.isAndroid
            ? _buildMaterial(context)
            : _buildCupertino(context),
      );

  Widget _buildCupertino(BuildContext context) =>
      CupertinoBottomNavigationScaffold(
        navigationBarItems: widget.navigationBarItems,
        onItemSelected: onTabSelected,
        selectedIndex: _currentlySelectedIndex,
      );

  Widget _buildMaterial(BuildContext context) =>
      MaterialBottomNavigationScaffold(
        navigationBarItems: widget.navigationBarItems,
        onItemSelected: onTabSelected,
        selectedIndex: _currentlySelectedIndex,
      );

  void onTabSelected(int newIndex) {
    if (_currentlySelectedIndex == newIndex) {
      widget.navigationBarItems[newIndex].navigatorKey.currentState!
          .popUntil((route) => route.isFirst);
    }

    if (Platform.isAndroid) {
      setState(() {
        _currentlySelectedIndex = newIndex;
      });
    } else {
      _currentlySelectedIndex = newIndex;
    }
  }
}
