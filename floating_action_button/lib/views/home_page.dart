import 'package:floating_action_button/controller/button_controller.dart';
import 'package:floating_action_button/widgets/circular_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State{

  final ButtonController buttonController = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<ButtonController>(
        init: ButtonController(),
        builder: (controller) => Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                right: 30,
                bottom: 30,
                child: Stack(
                  children: [
                    GetBuilder<ButtonController>(
                      init: ButtonController(),
                      builder: (controller) =>
                          Transform.translate(
                            offset: Offset.fromDirection(
                                controller.getRadiansFromDegree(260), controller.degOneTranslationAnimation.value * 100),
                            child: Transform(
                              transform: Matrix4.rotationZ(controller.getRadiansFromDegree(controller.rotationAnimation.value))
                                ..scale(controller.degOneTranslationAnimation.value),
                              alignment: Alignment.center,
                              child: CircularButton(
                                color: Colors.blue,
                                width: 50,
                                height: 50,
                                icon: Icon(
                                  Icons.qr_code,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                    ),
                    GetBuilder<ButtonController>(
                      init: ButtonController(),
                      builder: (controller) => Transform.translate(
                        offset: Offset.fromDirection(
                            controller.getRadiansFromDegree(200), controller.degOneTranslationAnimation.value * 100),
                        child: Transform(
                          transform: Matrix4.rotationZ(controller.getRadiansFromDegree(controller.rotationAnimation.value))
                            ..scale(controller.degOneTranslationAnimation.value),
                          alignment: Alignment.center,
                          child: CircularButton(
                            color: Colors.orangeAccent,
                            width: 50,
                            height: 50,
                            icon: Icon(
                              Icons.nfc,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GetBuilder<ButtonController>(
                      init: ButtonController(),
                      builder: (controller) => Transform(
                        transform: Matrix4.rotationZ(controller.getRadiansFromDegree(controller.rotationAnimation.value)),
                        alignment: Alignment.center,
                        child: CircularButton(
                          color: Colors.red,
                          width: 60,
                          height: 60,
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          onClick: () {
                            if (controller.animationController.isCompleted) {
                              controller.animationController.reverse().obs;
                            } else {
                              controller.animationController.forward().obs;
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}