import 'package:flutter/material.dart';

class ExpandedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Taşma hatalarına son!"),
      ),

      body: Row(
          children: <Widget>[

            Expanded(child: Image.asset("resimler/sokak.jpg")),

            Expanded(child: Image.asset("resimler/sokak.jpg")),

            Expanded(child: Image.asset("resimler/sokak.jpg")),

            Expanded(child: Image.asset("resimler/sokak.jpg")),


          ],
        ),

    );
  }

}