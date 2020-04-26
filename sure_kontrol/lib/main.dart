import 'dart:async';

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

        primarySwatch: Colors.blue,
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

  Timer timer;

  int start = 15;


  @override
  void initState() {
    startTimer();

  }


  @override
  void dispose() {
    timer.cancel();
    super.dispose();

  }

  void startTimer(){
    
    timer = Timer.periodic(Duration(seconds: 1),
        (Timer timer) {

      setState(() {

        if(start < 1)
        {
            _incrementCounter();
        }
        else
        {
          start -- ;
        }
      });

        });
  }


  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      if(start != 0)
         { _counter++; }

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                '$start',
                style: TextStyle(
                  fontSize: 24
                ),
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),   );
  }
}
