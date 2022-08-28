import 'package:flutter/material.dart';
import 'package:sticky_headers_example/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Sticky Header',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomeScreen(),
    );
  }
}
