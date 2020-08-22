import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountDownTimer(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: Colors.red,
      ),
    );
  }
}

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  AnimationController controller;

  int day = 2;
  int hour;
  int minute;
  int seconds;



  String get timerString {

        Duration duration = controller.duration * controller.value;
        return '${duration.inDays % 60} : ${duration.inHours % 60}  : ${duration.inMinutes % 60} : ${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

  }


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(minutes: 20, seconds: 10),
    );



    controller.reverse(
        from: controller.value == 0.0
            ? 1.0
            : controller.value);


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white10,
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[


                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[



                                      Text(
                                        timerString,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.white),
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[

                                          Text("Gün", style: TextStyle(color: Colors.white),),
                                          Text("Saat", style: TextStyle(color: Colors.white),),
                                          Text("Dakika", style: TextStyle(color: Colors.white),),
                                          Text("Saniye", style: TextStyle(color: Colors.white),)

                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),






                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: <Widget>[

                            Row(
                              children: <Widget>[
                                /*
                                Container(
                                  decoration:
                                  BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.blue[600],
                                          Colors.blue[900],
                                        ],
                                      ),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("0", style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                                 */

                                SlideCountdownClock(
                                  duration: Duration(hours: 10%60, minutes: 3%60, seconds: 30%60),
                                  slideDirection: SlideDirection.Down,
                                  separator: "-",
                                  textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  separatorTextStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange,
                                  ),
                                  padding: EdgeInsets.all(10),
                                  decoration:
                                  BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.blue[600],
                                          Colors.blue[900],
                                        ],
                                      ),
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(Radius.circular(5))
                                  ),
                                  onDone: () {
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),



                      AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return FloatingActionButton.extended(
                                onPressed: () {
                                  if (controller.isAnimating)
                                    controller.stop();
                                  else {
                                    controller.reverse(
                                        from: controller.value == 0.0
                                            ? 1.0
                                            : controller.value);
                                  }
                                },
                                icon: Icon(controller.isAnimating
                                    ? Icons.pause
                                    : Icons.play_arrow),
                                label: Text(
                                    controller.isAnimating ? "Pause" : "Play"));
                          }),




                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

