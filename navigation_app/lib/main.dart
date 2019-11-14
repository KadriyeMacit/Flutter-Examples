import 'package:flutter/material.dart';
import 'package:navigation_app/uri/navigasyon_islemleri.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter dersleri",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.orange,
    ),

    home: NavigasyonIslemleri(),
  ));
}
