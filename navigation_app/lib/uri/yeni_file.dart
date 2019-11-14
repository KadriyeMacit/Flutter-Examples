import 'package:flutter/material.dart';

class Asayfasi extends StatefulWidget{

  uygulama2 createState() => uygulama2();

}

class uygulama2 extends State<Asayfasi>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Navigasyon İşlemleri",
        style: TextStyle(color: Colors.white),),
      ),


      body: Column(
        children: <Widget>[
          Text("A sayfasına hoş geldiniz!")
        ],
      )
    );
  }

}