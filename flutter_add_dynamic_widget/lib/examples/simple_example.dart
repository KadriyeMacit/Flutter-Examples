import 'package:flutter/material.dart';

class SimpleExample extends StatefulWidget {
  const SimpleExample({Key? key}) : super(key: key);

  @override
  State<SimpleExample> createState() => _SimpleExampleState();
}

class _SimpleExampleState extends State<SimpleExample> {
  List<Widget> dynamicList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            dynamicList.add(Container());
          });
        },
      ),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
        itemCount: dynamicList.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.amber,
            height: 50,
            width: 50,
          );
        });
  }
}
