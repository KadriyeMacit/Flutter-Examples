import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  TextPage({Key? key}) : super(key: key);

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
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
          child: Text('Text Page'),
        ),
      ),
    );
  }
}
