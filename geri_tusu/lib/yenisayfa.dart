import 'package:flutter/material.dart';

class YeniSayfa extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop:(){

        debugPrint("geri çıktık");

      },


      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "On Back pressed",
            style: new TextStyle(color: Colors.white),
          ),
        ),
        body: new Center(
          child: new Text("Home Page"),
        ),
      )

    );
  }


}