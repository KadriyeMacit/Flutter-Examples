import 'package:floating_action_button/controller/button_controller.dart';
import 'package:floating_action_button/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/circular_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
