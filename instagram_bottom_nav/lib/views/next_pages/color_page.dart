import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  ColorPage({Key? key}) : super(key: key);

  @override
  _ColorPageState createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Bottom Navigation Bar',
          maxLines: 1,
        ),
      ),
      body: Center(
        child: Container(
          child: Text('Color Page'),
        ),
      ),
    );
  }
}
