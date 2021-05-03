import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController controller;

  AnimationController animationControllerOn;

  AnimationController animationControllerOff;

  Animation colorTweenBackgroundOn;
  Animation colorTweenBackgroundOff;
  Animation colorTweenForegroundOn;
  Animation colorTweenForegroundOff;

  int currentIndex = 0;
  int prevControllerIndex = 0;
  double aniValue = 0.0;

  double prevAniValue = 0.0;

  List icons = [
    'Icons.star',
    'Icons.whatshot',
  ];

  Color _foregroundOn = Colors.white;
  Color _foregroundOff = Colors.black;

  Color _backgroundOn = Colors.blue;
  Color _backgroundOff = Colors.grey[300];

  ScrollController scrollController = ScrollController();

  List keys = [];

  bool buttonTap = false;

  @override
  void onInit() {
    super.onInit();
    for (int index = 0; index < icons.length; index++) {
      keys.add(new GlobalKey());
    }

    controller = TabController(vsync: this, length: icons.length);

    controller.animation.addListener(handleTabAnimation);

    controller.addListener(handleTabChange);
    animationControllerOff =
        AnimationController(vsync: this, duration: Duration(milliseconds: 75));

    animationControllerOff.value = 1.0;
    colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(animationControllerOff);
    colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(animationControllerOff);
    animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));

    animationControllerOn.value = 1.0;
    colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(animationControllerOn);
    colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(animationControllerOn);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }



  handleTabAnimation() {
    aniValue = controller.animation.value;

    if (!buttonTap && ((aniValue - prevAniValue).abs() < 1)) {
      setCurrentIndex(aniValue.round());
    }

    prevAniValue = aniValue;
  }

  handleTabChange() {
    if (buttonTap) setCurrentIndex(controller.index);

    if ((controller.index == prevControllerIndex) ||
        (controller.index == aniValue.round())) buttonTap = false;

    prevControllerIndex = controller.index;
  }

  setCurrentIndex(int index) {
    if (index != currentIndex) {
      update();

      currentIndex = index;

      triggerAnimation();

      scrollTo(index);
    }
  }

  triggerAnimation() {
    animationControllerOn.reset();
    animationControllerOff.reset();

    animationControllerOn.forward();
    animationControllerOff.forward();
  }

  scrollTo(int index) {
    double screenWidth = 400;

    RenderBox renderBox = keys[index].currentContext.findRenderObject();

    double size = renderBox.size.width;

    double position = renderBox.localToGlobal(Offset.zero).dx;

    double offset = (position + size / 2) - screenWidth / 2;

    if (offset < 0) {
      renderBox = keys[0].currentContext.findRenderObject();

      position = renderBox.localToGlobal(Offset.zero).dx;

      if (position > offset) offset = position;
    } else {
      renderBox = keys[icons.length - 1].currentContext.findRenderObject();

      position = renderBox.localToGlobal(Offset.zero).dx;

      size = renderBox.size.width;

      if (position + size < screenWidth) screenWidth = position + size;

      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }

    scrollController.animateTo(offset + scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  getBackgroundColor(int index) {
    if (index == currentIndex) {
      return colorTweenBackgroundOn.value;
    } else if (index == prevControllerIndex) {
      return colorTweenBackgroundOff.value;
    } else {
      return _backgroundOff;
    }
  }

  getForegroundColor(int index) {
    if (index == currentIndex) {
      return colorTweenForegroundOn.value;
    } else if (index == prevControllerIndex) {
      return colorTweenForegroundOff.value;
    } else {
      return _foregroundOff;
    }
  }
}
