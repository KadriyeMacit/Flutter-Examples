import 'package:flutter/material.dart';

class CenterPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(

        child: Container(

          height: 100,
          width: 100,
          color: Colors.deepOrange,
        ),

      ),
    );
  }


}