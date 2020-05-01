import 'package:flutter/material.dart';
import 'package:sayfa_yapilari/center.dart';
import 'package:sayfa_yapilari/row.dart';
import 'package:sayfa_yapilari/stack.dart';

import 'column.dart';
import 'container.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Sayfa yapıları'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
        title: Text(widget.title, style: TextStyle(color: Colors.black),),
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              onPressed: (){

                Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => CenterPage()),);

              },
              child: Text("Center", style: TextStyle(color: Colors.white),),
              color: Colors.indigo,
            ),

            RaisedButton(
              onPressed: (){

                Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => ColumnPage()),);

              },
              child: Text("Column", style: TextStyle(color: Colors.white),),
              color: Colors.pinkAccent,
            ),

            RaisedButton(
              onPressed: (){

                Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => ContainerPage()),);

              },
              child: Text("Container", style: TextStyle(color: Colors.white),),
              color: Colors.lightGreen,
            ),

            RaisedButton(
              onPressed: (){

                Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => RowPage()),);

              },
              child: Text("Row", style: TextStyle(color: Colors.black),),
              color: Colors.cyanAccent,
            ),

            RaisedButton(
              onPressed: (){

                Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => StackPage()),);

              },
              child: Text("Stack", style: TextStyle(color: Colors.white),),
              color: Colors.redAccent,
            ),




          ],
        )
      ),



    );
  }
}
