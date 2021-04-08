import 'package:flutter/material.dart';
import 'package:snapping_sheet_example/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snapping Sheet Examples',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: HomePage(),
      // home: PreviewReversePage(),
    );
  }
}
