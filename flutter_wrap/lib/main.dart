import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.spaceAround,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.up,
          spacing: 20,
          runSpacing: 40,
          children: <Widget>[

            Container(
              color: Colors.cyan,
              height: 200,
              width: 100,
            ),


            Container(
              color: Colors.purple,
              height: 200,
              width: 100,
            ),


            Container(
              color: Colors.yellowAccent,
              height: 200,
              width: 100,
            ),


            Container(
              color: Colors.pinkAccent,
              height: 200,
              width: 100,
            ),

            Container(
              color: Colors.blueAccent,
              height: 200,
              width: 100,
            ),

          ],
        ),
      ),
     );
  }
}
