import 'package:flutter/material.dart';

class DummyContent extends StatelessWidget {
  final bool reverse;
  final ScrollController? controller;

  const DummyContent({Key? key, this.controller, this.reverse = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            ListTile(
              title: Text("Hello World"),
              //subtitle: Text("Kadriye Macit"),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.label),
            ),
            ListTile(
              title: Text("Hello World"),
              //subtitle: Text("Kadriye Macit"),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.label),
            ),
            ListTile(
              title: Text("Hello World"),
              //subtitle: Text("Kadriye Macit"),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.label),
            ),
            ListTile(
              title: Text("Hello World"),
              //subtitle: Text("Kadriye Macit"),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.label),
            ),
            ListTile(
              title: Text("Hello World"),
              //subtitle: Text("Kadriye Macit"),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.label),
            ),
            ListTile(
              title: Text("Hello World"),
              //subtitle: Text("Kadriye Macit"),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.label),
            ),
            ListTile(
              title: Text("Hello World"),
              //subtitle: Text("Kadriye Macit"),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.label),
            )
          ],
        ));
  }
}
