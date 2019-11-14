import 'package:flutter/material.dart';
import 'package:navigation_app/uri/yeni_file.dart';

class NavigasyonIslemleri extends StatefulWidget{

  uygulama createState() => uygulama();
}

class uygulama extends State<NavigasyonIslemleri>{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Navigasyon İşlemleri",
       style: TextStyle(color: Colors.white),),
     ),

     body: Column(
       children: <Widget>[
         RaisedButton(child:
           Text("A sayfasına git"),
         color:Colors.blue,
         onPressed: (){

           Navigator.push(context,
           MaterialPageRoute(builder:
           (context) => Asayfasi()),);


         },)
       ],
     ),
   );
  }




}