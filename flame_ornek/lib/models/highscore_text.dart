import 'package:flame_ornek/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HighscoreText {
  final GameController gameController;
  TextPainter painter;
  Offset position;

  HighscoreText(this.gameController) {
    painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    position = Offset.zero;
  }

  void render(Canvas c) {
    painter.paint(c, position);
  }

  void update(double t) {
    int highscore = gameController.storage.getInt('highscore') ?? 0;
    painter.text = TextSpan(
      text: 'Highscore: $highscore',
      style: TextStyle(
        color: Colors.black,
        fontSize: 40.0,
      ),
    );
    painter.layout();

    position = Offset(
      (gameController.screenSize.width / 2) - (painter.width / 2),
      (gameController.screenSize.height * 0.2) - (painter.height / 2),
    );
  }
}