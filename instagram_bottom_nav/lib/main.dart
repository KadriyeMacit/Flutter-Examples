import 'package:flutter/material.dart';
import 'package:instagram_bottom_nav/menu_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bottom Navigation Example',
        theme: ThemeData(primaryColor: Colors.white),
        home: MenuPage(),
      );
}
