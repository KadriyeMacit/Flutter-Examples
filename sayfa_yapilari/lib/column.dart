import 'package:flutter/material.dart';

class ColumnPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center, //x ekseni
       mainAxisAlignment: MainAxisAlignment.spaceAround,   //y ekseni

        children: <Widget>[

          Icon(Icons.home),

          Container(
            height: 10,
            width: 10,
            color: Colors.blueAccent,
          ),

          Icon(Icons.ac_unit),

          Icon(Icons.local_florist),

          Icon(Icons.opacity),

          Icon(Icons.people),



        ],


      )



    );
  }


}