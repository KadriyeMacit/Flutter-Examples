import 'package:flutter/material.dart';

class DarkAppBar {
  final String title;

  const DarkAppBar({required this.title});

  AppBar build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber.shade200,
      elevation: 0,
      title: Text(
        this.title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
