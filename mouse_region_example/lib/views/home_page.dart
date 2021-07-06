import 'package:flutter/material.dart';

import 'grid_element_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mouse Region'),
        ),
        body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(10, (index) {
              return OverlayAnimatedGridElement(
                  "https://picsum.photos/300/200");
            })));
  }
}
