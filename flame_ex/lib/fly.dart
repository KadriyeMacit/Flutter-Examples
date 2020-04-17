import 'dart:ui';
import 'langaw-game.dart';

class Fly {
  final LangawGame game;
  Rect flyRect;
  Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);  //konumunu yayıyor
    flyPaint = Paint();  //düşen kareyi yönetiyor
    flyPaint.color = Color(0xff6ab84c);
  }
  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {
    if (isDead==true) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if(flyRect.top > game.screenSize.height){
        isOffScreen = true;
      }
    }
  }

  void onTapDown() {
    isDead = true;
    flyPaint.color = Color(0xffff4757);
    game.spawnFly();
  }
}