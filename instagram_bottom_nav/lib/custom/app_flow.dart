import 'package:flutter/widgets.dart';

class AppFlow {
  const AppFlow(
      {required this.title,
      required this.iconData,
      required this.navigatorKey,
      required this.pageIndex});

  final String title;
  final IconData iconData;
  final GlobalKey<NavigatorState> navigatorKey;
  final int pageIndex;
}
