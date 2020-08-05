import 'package:flutter/material.dart';
import 'package:slider_level_ui/score_slider.dart';

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
      home: MyHomePage(title: 'Slider örneği'),
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

  int _currentScore;
  int _value;



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

            /*
            Slider(
              min: 0,
              max: 100,
             // value: _value,
              onChanged: (value) {
                setState(() {
                 // _value = value;
                });
              },
            ),

            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: RectangularSliderTrackShape(),
                trackHeight: 4.0,
                thumbColor: Colors.redAccent,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
              ),
              child: Slider(
               // value: _value,
                onChanged: (value) {
                  setState(() {
                 //   _value = value;
                  });
                },
              ),
            ),


            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.red[700],
                inactiveTrackColor: Colors.red[100],
                trackShape: RoundedRectSliderTrackShape(),
                trackHeight: 4.0,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                thumbColor: Colors.redAccent,
                overlayColor: Colors.red.withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                tickMarkShape: RoundSliderTickMarkShape(),
                activeTickMarkColor: Colors.red[700],
                inactiveTickMarkColor: Colors.red[100],
                valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                valueIndicatorColor: Colors.redAccent,
                valueIndicatorTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Slider(
               // value: _value,
                min: 0,
                max: 100,
                divisions: 10,
                label: '$_value',
                onChanged: (value) {
                  setState(
                        () {
                  //    _value = value;
                    },
                  );
                },
              ),
            ),

             */


            Container(
              child: ScoreSlider(
                minScore: 1,
                maxScore: 7,
                thumbColor: Colors.deepOrangeAccent,
                scoreDotColor: Colors.white,
                onScoreChanged: (newScore) {
                  setState(() {
                    _currentScore = newScore;
                  });
                },
              ),
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _currentScore == null
                  ? "No Score Selected"
                  : "Selected Score: $_currentScore",
              style: Theme.of(context).textTheme.subtitle,
            ),

          ],
        ),
      ),

      );
  }
}
