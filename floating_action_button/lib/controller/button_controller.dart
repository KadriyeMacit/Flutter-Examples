import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ButtonController extends GetxController with SingleGetTickerProviderMixin{
  AnimationController animationController;
  Animation degOneTranslationAnimation, degTwoTranslationAnimation;
  Animation rotationAnimation;


  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    update();
    return degree / unitRadian;
  }


  @override
  void onInit(){
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0,end: 1.2), weight: 65.0),
      TweenSequenceItem(tween: Tween(begin: 1.2,end: 1.0), weight: 25.0),
    ])
        .animate(animationController);
    update();
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0,end: 1.75), weight: 45.0),
      TweenSequenceItem(tween: Tween(begin: 1.75,end: 1.0), weight: 65.0)
    ])
        .animate(animationController);
    update();
    rotationAnimation = Tween(begin: 180.0, end: 0.0)
        .animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.onInit();
    animationController.addListener(() {
     update();
    });


  }

  @override
  void onClose() {
    animationController.dispose();
    super.dispose();
  }
}