import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:random_pk/random_pk.dart';

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
    AnimationController(duration: Duration(seconds: 10), vsync: this)
      ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RandomContainer(
          height: 500.0,
          width: 200.0,
          child: AnimatedBuilder(
            animation: _animationController,
            child: Container(
              height: 50.0,
              width: 50.0,
              color: Colors.red,
            ),
            builder: (context, child) => Transform.rotate(
              child: child,
              angle: _animationController.value * 1.0 * math.pi,
            ),
          ),
        ),
      ),
    );
  }
}
