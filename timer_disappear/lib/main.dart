import 'dart:async';
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool _visible = true;

  AnimationController _animationController;

  var _color = Colors.red;
  var _height =  200.0;
  var _width = 400.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
    AnimationController(duration: Duration(seconds: 10), vsync: this)
      ..repeat();

    Timer(Duration(seconds: 15), () {
      animateContainer();
    });


    Timer(Duration(seconds: 15), () {
      setState(() {
        _visible = !_visible;
      });
    });
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                AnimatedOpacity(
                  // If the widget is visible, animate to 0.0 (invisible).
                  // If the widget is hidden, animate to 1.0 (fully visible).
                  opacity: _visible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 500),
                  // The green box must be a child of the AnimatedOpacity widget.
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.green,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),


                /*
        RandomContainer(
          height: 200.0,
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
              angle: _animationController.value * 3.0 * math.pi,
            ),
          ),
        ),
         */

                SizedBox(height: 50,),

                AnimatedContainer(
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(seconds: 2),
                  color: Colors.transparent,
                  height: _height,
                  width: _width,
                  child: Image.asset("images/abc.png"),
                ),

                /*
        FlatButton(
          child: Text("Animate"),
          onPressed: () {
            Timer(Duration(seconds: 10), () {
              animateContainer();
            });
          },
          color: Colors.blue,
          colorBrightness: Brightness.dark,
        ),
        */

              ],
            )
        )
    );
  }

  animateContainer() {
    setState(() {
      // _color = _color == Colors.red ? Colors.deepPurple : Colors.red;
      _height = _height == 200 ? 0 : 200;
      _width = _width == 400 ? 0 : 400;
    });
  }
}
