import 'package:flutter/widgets.dart';

class BottomNavigationTab {
  const BottomNavigationTab({
    required this.bottomNavigationBarItem,
    required this.navigatorKey,
    required this.initialPageBuilder,
  });

  final BottomNavigationBarItem bottomNavigationBarItem;
  final GlobalKey<NavigatorState> navigatorKey;
  final WidgetBuilder initialPageBuilder;
}
