import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Rastgele Resimler'),
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


  dynamic randomImages = [
    "images/a.jpg",
    "images/b.jpg",
    "images/c.jpg",
    "images/d.jpg"
  ];

  Random rnd;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            buildImage(context),

          ],
        ),
      ),

    );
  }


  Widget buildImage(BuildContext context) {
    int min = 0;
    int max = randomImages.length-1;
    rnd = new Random();
    int r = min + rnd.nextInt(max - min);
    String image_name  = randomImages[r].toString();
    return Expanded(child: Image.asset(image_name));
  }


}
