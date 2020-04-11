import 'dart:math' as math;
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      canvasColor: Colors.deepPurple,
      iconTheme: IconThemeData(color: Colors.white),
      accentColor: Colors.pinkAccent,
      brightness: Brightness.dark,
    ),
    home: new MyHomePage(),
  ));
}

class ProgressPainter extends CustomPainter {
  ProgressPainter({
    @required this.animation,
    @required this.backgroundColor,
    @required this.color,
  }) : super(repaint: animation);


  final Animation<double> animation;

  final Color backgroundColor;

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = backgroundColor
      ..strokeWidth = 3.0   // çizgi kalınlığı
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);   // sürenin tamamlanmamış kısmının çizgisi
    paint.color = color;
    double progressRadians = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(
        Offset.zero & size, math.pi * 1.5, -progressRadians, false, paint);
  }

  @override
  bool shouldRepaint(ProgressPainter other) {
    return animation.value != other.animation.value ||
        color != other.color ||
        backgroundColor != other.backgroundColor;
  }
}

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController _controller;

  String get timeRemaining {
    Duration duration = _controller.duration * _controller.value;
    return '${(duration.inSeconds % 60).toString().padLeft(2, '0')}';  // 2 haneli ve sadece saniye
  }

  @override
  void initState() {
    super.initState();

    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),   //saniyenin başlangıcı
    )
      ..reverse(from: 1); // hangi saniyeden geriye dönecek belirliyor


  }



  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top: 30.0, right: 20),
              child: Stack(
                children: <Widget>[


                  //süredeki oynayan yuvarlak
                  Align(
                    alignment: FractionalOffset.topRight,
                    child: AnimatedBuilder(
                        animation: _controller,
                        builder: (BuildContext context, Widget child) {
                          return CustomPaint(
                            size: Size(50, 50),
                            painter: ProgressPainter(
                              animation: _controller,
                              color: themeData.indicatorColor,
                              backgroundColor: Colors.white,
                            ),
                          );
                        }),
                  ),




                  //sürenin yazısı
                  Padding(
                    padding: const EdgeInsets.only(top: 12, right: 14),
                    child: Align(
                      alignment: FractionalOffset.topRight,

                      child:  AnimatedBuilder(
                          animation: _controller,
                          builder: (BuildContext context, Widget child) {

                            return Text(
                              timeRemaining,
                              style: TextStyle(fontSize: 20),
                            );
                          }),


                    ),
                  ),


                ],
              ),
            ),


            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget child) {
                        return Icon(_controller.isAnimating
                            ? Icons.pause
                            : Icons.play_arrow);
                      },
                    ),
                    onPressed: () {
                      if (_controller.isAnimating)
                        _controller.stop();
                      else {
                        _controller.reverse(
                          from: _controller.value == 0.0
                              ? 1.0
                              : _controller.value,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
