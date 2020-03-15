import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(


        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Fonts Uygulaması"),
        ),

        body: Container(
          child: Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hello World",
                style: TextStyle(
                  fontSize: 44,
                  color: Colors.blue[200],
                  fontFamily: "Crafty"
                ),),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hello World",
                  style: TextStyle(
                    fontSize: 44,
                    color: Colors.pinkAccent[200],
                    fontStyle: FontStyle.italic,
                    fontFamily: "Luckiest"
                  ),),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hello World",
                  style: TextStyle(
                    fontSize: 44,
                    color: Colors.green[200],
                    fontFamily: "Montserrat"
                  ),),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hello World",
                  style: TextStyle(
                    fontSize: 44,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Mountain"
                  ),),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hello World",
                  style: TextStyle(
                      fontSize: 44,
                      color: Colors.brown,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poiret"
                  ),),
              ),


            ],
          ),
        )


      ),

    );
  }



}