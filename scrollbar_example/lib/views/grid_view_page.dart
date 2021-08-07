import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  GridViewPage({Key? key}) : super(key: key);

  @override
  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: Scrollbar(
          controller: _controller,
          isAlwaysShown: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              controller: _controller,
              itemCount: 50,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20, crossAxisSpacing: 20, crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.cyan,
                  child: Center(
                      child: Text(
                    '${index + 1}. lesson',
                    style: TextStyle(color: Colors.white),
                  )),
                );
              },
            ),
          ),
        ));
  }
}
