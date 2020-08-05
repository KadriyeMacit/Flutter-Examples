library flutter_score_slider;

import 'package:flutter/material.dart';

/// ScoreSlider
/// A Custom Slider componente that mainly used for selecting a Score.
/// You can set a minimum and maximum score value and current score.
/// Current score can also be null so the user can choose the score without and default score entered.
///
/// Example
/// ```dart
/// ScoreSlider(
///   maxScore: 10,
///   backgroundColor: Colors.black,
///   thumbColor: Colors.blue,
///   scoreDotColor: Colors.white,
///   onScoreChanged: (newScore) {
///                     setState(() {
///                       _currentScore = newScore;
///                     });
///                },
///   )
/// ```
///
class ScoreSlider extends StatefulWidget {
  final double height;
  final int score;
  final int maxScore;
  final int minScore;
  final Color thumbColor;
  final Color scoreDotColor;
  final Color backgroundColor;
  final Function(int value) onScoreChanged;

  /// Create ScoreSlider Widgets.
  ///
  /// You must provide [maxScore] parameter with the Maximum score allowed.
  ///
  /// You can set also minimum score by using [minScore] Parameter. the defualt minScore is 0.
  ///
  /// To get a call back when the user select score implement [onScoreChanged] callback
  ///
  /// You can customize the Slider colors by using [thumbColor], [scoreDotColor] and [backgroundColor] parameter.
  /// If not specify, Colors will be take from the default ThemeData.
  ///
  /// The default height of the Slider is 30, in order to set other height, use [height] parameter.
  ScoreSlider({
    @required this.maxScore,
    this.minScore = 0,
    this.score,
    this.onScoreChanged,
    this.height = 30,
    this.thumbColor,
    this.scoreDotColor,
    this.backgroundColor,
  })  : assert(maxScore != null),
        assert(minScore < maxScore);

  @override
  State<StatefulWidget> createState() => ScoreSliderState();
}

class ScoreSliderState extends State<ScoreSlider> {
  int _currentScore;

  @override
  void initState() {
    super.initState();
    _currentScore = this.widget.score;
  }

  List<Widget> _dots(BoxConstraints size) {
    List<Widget> dots = List<Widget>();

    double width =
        size.maxWidth / (this.widget.maxScore - this.widget.minScore + 1);
    double selectedScoreRadius = (this.widget.height * 0.7) / 2;
    double dotRadius = (this.widget.height * 0.25) / 3;

    for (var i = this.widget.minScore; i <= this.widget.maxScore; i++) {
      double currentRadius =
      i == _currentScore ? selectedScoreRadius : dotRadius;
      dots.add(
        Container(
          width: width,
          child: Center(
            child: CircleAvatar(
              child: Text("$_currentScore",
              style: TextStyle(
                color: Colors.white
              ),),
              backgroundColor: i == _currentScore
                  ? this.widget.thumbColor ?? Theme.of(context).sliderTheme.thumbColor
                  : this.widget.scoreDotColor ?? Theme.of(context).sliderTheme.activeTickMarkColor,
              radius: currentRadius / 1,
            ),
          ),
          color: Colors.transparent,
        ),
      );
    }

    return dots;
  }

  void _handlePanGesture(BoxConstraints size, Offset localPosition) {
    double socreWidth =
        size.maxWidth / (this.widget.maxScore - this.widget.minScore + 1);
    double x = localPosition.dx;
    int calculatedScore = (x ~/ socreWidth) + this.widget.minScore;
    if (calculatedScore != _currentScore &&
        calculatedScore <= this.widget.maxScore &&
        calculatedScore >= 0) {
      setState(() => _currentScore = calculatedScore);
      if (this.widget.onScoreChanged != null) {
        this.widget.onScoreChanged(_currentScore);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (context, size) {
          return GestureDetector(
            onPanDown: (details) {
              _handlePanGesture(size, details.localPosition);
            },
            onPanStart: (details) {
              _handlePanGesture(size, details.localPosition);
            },
            onPanUpdate: (details) {
              _handlePanGesture(size, details.localPosition);
            },
            child: Container(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: (this.widget.backgroundColor ?? Theme.of(context).backgroundColor) ,
                ),
                height: this.widget.height,
                child: Stack(
                  children: <Widget>[
                        Row(
                          children: _dots(size),
                        ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}