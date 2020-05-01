import 'package:flutter/material.dart';

class RowPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround, //x ekseni
        crossAxisAlignment: CrossAxisAlignment.stretch,  //y ekseni

        children: <Widget>[

          Container(
            height: 100,
            width: 30,
            color: Colors.pinkAccent,
          ),

          Container(
            height: 50,
            width: 30,
            color: Colors.blueAccent,
          ),

          Container(
            height: 30,
            width: 30,
            color: Colors.pinkAccent,
          ),

          Container(
            height: 70,
            width: 30,
            color: Colors.blueAccent,
          )




        ],



      )


    );
  }


}