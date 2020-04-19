import 'package:flutter/material.dart';

class RowPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Taşma hatalarına son!"),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[

            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 40,
            ),

            CircleAvatar(
              backgroundColor: Colors.yellowAccent,
              radius: 40,
            ),


            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 40,
            ),

            CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 40,
            ),

            CircleAvatar(
              backgroundColor: Colors.purple,
              radius: 40,
            ),

            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 40,
            ),


          ],
        ),
      ),
    );
  }

}